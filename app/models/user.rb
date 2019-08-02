# frozen_string_literal: true

# The application user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable,
         :omniauthable,
         omniauth_providers: %i[github]

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.\-]*$/, multiline: true

  attr_writer :login

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.github_data'])
        user.username = data['info']['nickname'] if user.username.blank?
        user.email = data['info']['email'] if user.email.blank?
      end
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    if (login = conditions.delete(:login))
      sql = "lower(username) = :value OR lower(email) = :value"
      args = { value: login.downcase }
      where(conditions.to_h).where([sql, args]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  def login
    @login || self.username || self.email
  end

  def password_required?
    super && provider.blank?
  end

  #def update_with_password(params, *options)
  #  if encrypted_password.blank?
  #    update(params.except(:current_password), *options)
  #  else
  #    super
  #  end
  #end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def to_s
    "#{username} <#{email}>"
  end
end

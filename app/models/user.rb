class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable and :timeoutable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :omniauthable, :omniauth_providers => [:github]

    attr_accessor :login

    has_many :posts

    validates :username, uniqueness: { case_sensitive: false }

    def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
            where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
        else
            where(conditions).first
        end
    end

    def self.from_omniauth(auth)
        where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
            user.username = auth.info.nickname
        end
    end

    def self.new_with_session(params, session)
        if session["devise.user_attributes"]
            new(session["devise.user_attributes"], without_protection: true) do |user|
                user.attributes = params
                user.valid?
            end
        else
            super
        end
    end

    def password_required?
        super && provider.blank?
    end

    def update_with_password(params, *options)
        if encrypted_password.blank?
            update_attributes(params, *options)
        else
            super
        end
    end

    def is_admin?
        self.admin
    end

    def to_s
        self.username
    end
end

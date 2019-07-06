# frozen_string_literal: true

# Describes a contact message.
class ContactMessage
  include ActiveModel::Model

  attr_accessor :name, :email, :body

  validates :name, :email, :body, presence: true

  def to_mail
    SiteMailer.contact_email name, email, body
  end
end

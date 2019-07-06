# frozen_string_literal: true

# Mailer for generic site emails.
class SiteMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    subject = t '.subject', name: @name
    mail(
      to: %("Adam Hellberg" <sharparam@sharparam.com>),
      reply_to: %("#{@name}" <#{@email}>),
      subject: subject)
  end
end

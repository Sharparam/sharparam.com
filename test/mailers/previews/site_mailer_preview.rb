# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/site_mailer
class SiteMailerPreview < ActionMailer::Preview
  def contact_email_preview
    message = ContactMessage.new(
      name: 'Lonami',
      email: 'totufals@hotmail.com',
      body: <<~MSG
        I love your site! It's so beautiful it makes my eyes water.
        Additionally, I wrote this message over multiple lines.
        So you can test your fancy quote code!
      MSG
    )

    message.to_mail
  end
end

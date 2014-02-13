class ContactMessage < MailForm::Base
    attribute :name, validate: true
    attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message
    attribute :nickname, captcha: true

    def headers
        {
            subject: 'Sharparam.com Contact Message',
            to: 'sharparam@sharparam.com',
            from: %("#{name}" <#{email}>)
        }
    end
end

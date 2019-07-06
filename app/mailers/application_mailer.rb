# frozen_string_literal: true

# Controls mailing.
class ApplicationMailer < ActionMailer::Base
  default from: %("Sharparam's site" <site@sharparam.com>)
  layout 'mailer'
end

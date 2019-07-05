# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV.fetch('SMTP_ADDRESS') { Rails.application.credentials.dig(:smtp, :address) },
    port: ENV.fetch('SMTP_PORT') { Rails.application.credentials.dig(:smtp, :port) || 587 },
    domain: ENV.fetch('SMTP_DOMAIN') { Rails.application.credentials.dig(:smtp, :domain) },
    user_name: ENV.fetch('SMTP_USERNAME') { Rails.application.credentials.dig(:smtp, :username) },
    password: ENV.fetch('SMTP_PASSWORD') { Rails.application.credentials.dig(:smtp, :password) },
    authentication: ENV.fetch('SMTP_AUTHENTICATION') do
      Rails.application.credentials.dig(:smtp, :authentication) || :plain
    end,
    enable_starttls_auto: Rails.application.credentials.dig(:smtp, :starttls_auto) || true
  }
end

# Initialize the Rails application.
Rails.application.initialize!

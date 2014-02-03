SharparamCom::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test?
    ('x' * 30)
else
    ENV.fetch("SECRET_TOKEN")
end

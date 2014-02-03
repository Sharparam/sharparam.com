SECRET_CONFIG = YAML.load_file("#{Rails.root}/config/secrets.yml")[Rails.env]

SharparamCom::Application.config.secret_key_base = SECRET_CONFIG["secret_key_base"]

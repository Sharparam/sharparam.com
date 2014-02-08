source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

gem 'bootstrap-sass', '~> 3.1.0.1'

gem 'font-awesome-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'slim-rails'

gem 'simple_form'
gem 'country_select'

gem 'pygments.rb'
gem 'redcarpet'

# Authentication gems
gem 'devise'
#gem 'omniauth'
gem 'omniauth-github'
gem 'cancan'

group :development do
    # Use sqlite3 as the database for Active Record in development
    gem 'sqlite3'

    # Use Guard to monitor file changes
    gem 'guard'
    gem 'guard-bundler'
    gem 'guard-rails'
    gem 'guard-livereload'

    # Use Capistrano for deployment
    gem 'capistrano', group: :development
    gem 'rvm-capistrano', group: :development
end

group :production do
    # Use PostgreSQL in production
    gem 'pg'
    gem 'unicorn'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use debugger
# gem 'debugger', group: [:development, :test]

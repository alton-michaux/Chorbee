source 'https://rubygems.org'

ruby '~> 3.2'

gem 'rails', '~> 7.1'

# Database
gem 'pg', '~> 1.5'

# App server
gem 'puma', '~> 6.0'

# Frontend
gem 'bootstrap', '~> 5.3'
gem 'dartsass-rails', '~> 0.5'
gem 'importmap-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# JSON API
gem 'jbuilder', '~> 2.11'

# Authentication
gem 'devise', '~> 4.9'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'devise-i18n'

# Calendar and recurring events
gem 'chartkick'
gem 'recurring_select'
gem 'simple_calendar', '~> 3.0'

# Windows timezone data
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem 'web-console'
  gem 'rails-erd'
  gem 'ruby-graphviz'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

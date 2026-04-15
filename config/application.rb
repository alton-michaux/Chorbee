require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChoresApp
  class Application < Rails::Application
    # Load Rails 7.1 defaults
    config.load_defaults 7.1

    config.beginning_of_week = :sunday
  end
end

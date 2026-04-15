ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require 'dotenv/load' unless ENV['RAILS_ENV'] == 'production'   # Load .env before Rails reads secrets/credentials.

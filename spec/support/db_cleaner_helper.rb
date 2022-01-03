# frozen_string_literal: true

require 'database_cleaner/active_record'

# database_cleaner helper module for feature specs (ensures that tests not
# using js:true still use transactional fixtures, while tests are js:true
# do not use transactional fixtures)
module CleanerConfigureHelper
  # this setting will allow database_cleaner to run in heroku envrionment
  #   DatabaseCleaner.allow_remote_database_url = true

  RSpec.configure do |config|
    # ensures clean slate on each test run
    config.before(:suite) do
      DatabaseCleaner.clean_with(:deletion)
    end

    # this setting allows for truncation strategy to be used to clean up
    # feature specs only
    # config.before(:each, type: :feature) do
    #   DatabaseCleaner.strategy = :truncation
    # end

    # the next two code blocks are called for all specs
    config.before do
      DatabaseCleaner.start
    end

    config.append_after do
      DatabaseCleaner.clean
    end
  end
end

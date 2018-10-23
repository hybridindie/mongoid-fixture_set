require 'bundler/setup'
require 'simplecov'
SimpleCov.configure do
  add_filter '/test/'
end
SimpleCov.start if ENV['COVERAGE']

require 'minitest/autorun'
require 'mongoid'

require 'database_cleaner'

require File.expand_path("../../lib/mongoid-fixtures", __FILE__)

Mongoid.load!("#{File.dirname(__FILE__)}/mongoid.yml", :test)

DatabaseCleaner.strategy = :truncation

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

ActiveSupport::TestCase.test_order = :random

class BaseTest < ActiveSupport::TestCase
  def teardown
    DatabaseCleaner.clean!
  end
end


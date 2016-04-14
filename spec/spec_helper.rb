require 'coveralls'

Coveralls.wear!('rails')

require File.expand_path("../../config/environment", __FILE__)

RSpec.configure do |config|
  require File.expand_path("../../config/environment", __FILE__)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:each, js: true) do
     DatabaseCleaner.strategy = :truncation
  end
end

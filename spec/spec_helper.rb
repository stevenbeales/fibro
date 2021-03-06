# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
require 'warning'
require_relative 'coverage_init'
require_relative 'init'

Warning.ignore(%i[method_redefined not_reached missing_ivar unused_var])
Warning.ignore(/mismatched indentation/)

# Sinatra testing
module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::MyApp
  end
end

ActiveRecord::Base.logger = nil

# Find n+1 queries
Bullet.raise = true # raise an error if n+1 query occurs

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include RSpecMixin
  config.include Sinatra::Fibro::Helpers
  config.include FactoryBot::Syntax::Methods
  
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # cleanup database and reload seeds
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    require './db/seeds'
    FactoryBot.find_definitions
  end

  config.before(:each) do
    Bullet.start_request
  end

  config.after(:each) do
    Bullet.perform_out_of_channel_notifications if Bullet.notification?
    Bullet.end_request
  end

  # use Timecop to allow date and time based specs
  config.before :each, timecop: :freeze do
    Timecop.freeze
  end

  config.after :each, timecop: :freeze do
    Timecop.return
  end

  # rspec-expectations config goes here.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  # rspec-mocks config goes here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is recommended, and will default to `true` in RSpec 4.
    mocks.verify_partial_doubles = true

    # This option should be set when all dependencies are being loaded
    # before a spec run, as is the case in a typical spec helper. It will
    # cause any verifying double instantiation for a class that does not
    # exist to raise, protecting against incorrectly spelt names.
    mocks.verify_doubled_constant_names = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4.
  # It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options.
  config.example_status_persistence_file_path = 'spec/examples.txt'

  # Limits the available syntax to the non-monkey patched syntax
  config.disable_monkey_patching!

  # This setting enables warnings
  config.warnings = true

  # It's useful to allow more verbose output when running an
  # individual spec file.
  # Use the documentation formatter for detailed output,
  # unless a formatter has already been configured
  # (e.g. via a command-line flag).
  config.default_formatter = 'doc' if config.files_to_run.one?

  # Print the 10 slowest examples and example groups at the
  # end of the spec run
  config.profile_examples = 10
end

# frozen_string_literal: true

require 'factory_initializer'

FactoryBot.define do
  factory :test_user, class: 'User' do
    user_id TestConstants::TEST_USER
    initialize_with { User.find_or_create_by! user_id: TestConstants::TEST_USER }
  end

  factory :timmy, class: 'User' do
    user_id 'Timmy'
    access_token 'AccessToken'
    initialize_with { User.find_or_create_by! user_id: 'Timmy', access_token: 'AccessToken' }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :test_user, class: 'User' do
    user_id TestConstants::TEST_USER
    initialize_with { User.find_or_create_by! user_id: TestConstants::TEST_USER }
  end

  factory :test_symptom_user, class: 'User' do
    user_id TestConstants::TEST_SYMPTOM_USER
    initialize_with { User.find_or_initialize_by user_id: TestConstants::TEST_SYMPTOM_USER }
  end

  factory :test_symptom, class: 'Symptom' do
    name TestConstants::TEST_SYMPTOM
    initialize_with { Symptom.find_or_create_by! name: TestConstants::TEST_SYMPTOM }
  end

  factory :test_symptom_log, class: 'SymptomLog' do
    association :user, factory: :test_symptom_user
  end

  factory :timmy, class: 'User' do
    user_id 'Timmy'
    access_token 'AccessToken'
    initialize_with { User.find_or_create_by! user_id: 'Timmy', access_token: 'AccessToken' }
  end

  factory :headache, class: 'Symptom' do
    name 'Headache'
    initialize_with { Symptom.find_or_create_by! name: 'Headache' }
  end

  factory :timmy_log, class: 'SymptomLog' do
    association :user, factory: :timmy
  end
end

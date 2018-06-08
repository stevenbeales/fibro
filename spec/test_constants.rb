# frozen_string_literal: true

# This module contains all constants used in tests
module TestConstants
  # Test User used in User specs
  TEST_USER = 'TestUser'
  # Test Symptom User used in Symptom specs
  TEST_SYMPTOM_USER = 'TestSymptomUser'
  # Test Symptom used in Symptom specs
  TEST_SYMPTOM = 'TestSymptom'
  # Test Symptom Log used in Symptom Log specs
  TEST_SYMPTOM_LOG = 'TestSymptomLog'
  TEST_JSON = %(
  {
    "version": "1.0",
    "session": {
      "new": true,
      "sessionId": "amzn1.echo-api.session.abeee1a7-aee0-41e6-8192-e6faaed9f5ef",
      "attributes": {},
      "user": {
        "userId": "amzn1.account.AM3B227HF3FAM1B261HK7FFM3A2"
      }
    },
    "request": {
      "type": "LaunchRequest",
      "requestId": "amzn1.echo-api.request.9cdaa4db-f20e-4c58-8d01-c75322d6c423",
      "timestamp":"2017-07-12T19:10:19Z"
    }
  })
end

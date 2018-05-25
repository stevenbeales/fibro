# frozen_string_literal: true

# Class to build utterances for Resume Intent
class ResumeIntentBuilder < IntentBuilder
  RESUME_INTENTS = [
    'Resume'
  ].freeze

  def add
    add_intents(RESUME_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for Resume Intent
class ResumeIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::RESUME_INTENTS)
  end
end

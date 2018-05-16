# frozen_string_literal: true

# Class to build utterances for Resume Intent
class ResumeIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('resume')
  end
end

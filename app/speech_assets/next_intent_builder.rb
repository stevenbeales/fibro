# frozen_string_literal: true

# Class to build utterances for Next Intent
class NextIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('next')
  end
end

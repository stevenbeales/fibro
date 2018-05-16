# frozen_string_literal: true

# Class to build utterances for No Intent
class NoIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('no')
  end
end

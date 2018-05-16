# frozen_string_literal: true

# Class to build utterances for Pause Intent
class PauseIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('pause')
  end
end

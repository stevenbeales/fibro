# frozen_string_literal: true

# Class to build utterances for Repeat Intent
class RepeatIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('repeat')
  end
end

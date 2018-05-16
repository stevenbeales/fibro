# frozen_string_literal: true

# Class to build utterances for Yes Intent
class YesIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('OK')
    intent.add_utterance_template('OKay')
    intent.add_utterance_template('yes')
  end
end

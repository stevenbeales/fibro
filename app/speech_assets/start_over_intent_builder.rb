# frozen_string_literal: true

# Class to build utterances for Start over Intent
class StartOverIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('home')
    intent.add_utterance_template('go home')
    intent.add_utterance_template('go to home')
    intent.add_utterance_template('start over')
    intent.add_utterance_template('start again')
    intent.add_utterance_template('re-start')
  end
end

# frozen_string_literal: true

# Class to build utterances for Yes Intent
class PreviousIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('previous')
  end
end

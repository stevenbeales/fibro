# frozen_string_literal: true

# Class to build utterances for Previous Intent
class PreviousIntentBuilder < IntentBuilder
  PREVIOUS_INTENTS = [
    'Back up',
    'Go back',
    'Previous',
    'Skip back'
  ].freeze

  def add
    add_intents(PREVIOUS_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for Previous Intent
class PreviousIntentBuilder < IntentBuilder
  PREVIOUS_INTENTS = [
    'Previous'
  ].freeze

  def add
    add_intents(PREVIOUS_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for Next Intent
class NextIntentBuilder < IntentBuilder
  NEXT_INTENTS = [
    'Another',
    'Next',
    'Now what'
  ].freeze

  def add
    add_intents(NEXT_INTENTS)
  end
end

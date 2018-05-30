# frozen_string_literal: true

# Class to build utterances for No Intent
class FallbackIntentBuilder < IntentBuilder
  FALLBACK_INTENTS = [
    'Fall back'
  ].freeze

  def add
    add_intents(FALLBACK_INTENTS)
  end
end

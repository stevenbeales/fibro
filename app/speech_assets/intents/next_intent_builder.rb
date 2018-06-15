# frozen_string_literal: true

# Class to build utterances for Next Intent
class NextIntentBuilder < IntentBuilder
  NEXT_INTENTS = [
    'After this',
    'Another',
    'Next',
    'Next off',
    'Now what',
    'Skip',
    'Skip forward'
  ].freeze

  def add
    add_intents(NEXT_INTENTS)
  end
end

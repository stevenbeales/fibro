# frozen_string_literal: true

# Class to build utterances for Cancel Intent
class CancelIntentBuilder < IntentBuilder
  CANCEL_INTENTS = [
    'Cancel',
    'Forget it',
    'Never mind'
  ].freeze

  def add
    add_intents(CANCEL_INTENTS)
  end
end

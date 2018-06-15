# frozen_string_literal: true

# Class to build utterances for Cancel Intent
class CancelIntentBuilder < IntentBuilder
  CANCEL_INTENTS = [
    'Abandon',
    'Ax',
    'Axe',
    'Call off',
    'Cancel',
    'Forget it',
    'Never mind',
    'Nix',
    'Scrap',
    'Scrub'
  ].freeze

  def add
    add_intents(CANCEL_INTENTS)
  end
end

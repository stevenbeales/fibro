# frozen_string_literal: true

# Class to build utterances for Pause Intent
class PauseIntentBuilder < IntentBuilder
  PAUSE_INTENTS = [
    'Freeze',
    'Pause',
    'Pause that'
  ].freeze

  def add
    add_intents(PAUSE_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for playing 'Everybody Hurts' by REM
class EverybodyHurtsIntentBuilder < IntentBuilder
  EVERYBODY_HURTS_INTENTS = [
    'Everybody Hurts'
  ].freeze

  def add
    add_intents(EVERYBODY_HURTS_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for playing 'Everybody Hurts' by REM
class EverybodyHurtsIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::EVERYBODY_HURTS_INTENTS)
  end
end

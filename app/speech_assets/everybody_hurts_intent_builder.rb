# frozen_string_literal: true

# Class to build utterances for playing 'Everybody Hurts' by REM
class EverybodyHurtsIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('Everybody Hurts')
  end
end

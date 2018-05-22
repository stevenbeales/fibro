# frozen_string_literal: true

# Class to build utterances for Pause Intent
class PauseIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::PAUSE_INTENTS)
  end
end

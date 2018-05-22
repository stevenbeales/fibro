# frozen_string_literal: true

# Class to build utterances for Stop Intent
class StopIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::STOP_INTENTS)
  end
end

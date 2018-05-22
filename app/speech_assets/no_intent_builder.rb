# frozen_string_literal: true

# Class to build utterances for No Intent
class NoIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::NO_INTENTS)
  end
end

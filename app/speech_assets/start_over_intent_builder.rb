# frozen_string_literal: true

# Class to build utterances for Start over Intent
class StartOverIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::START_OVER_INTENTS)
  end
end

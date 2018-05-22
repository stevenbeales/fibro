# frozen_string_literal: true

# Class to build utterances for Yes Intent
class PreviousIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::PREVIOUS_INTENTS)
  end
end

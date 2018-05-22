# frozen_string_literal: true

# Class to build utterances for Yes Intent
class YesIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::YES_INTENTS)
  end
end

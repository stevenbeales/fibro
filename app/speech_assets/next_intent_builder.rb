# frozen_string_literal: true

# Class to build utterances for Next Intent
class NextIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::NEXT_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for Cancel Intent
class CancelIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::CANCEL_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for Repeat Intent
class RepeatIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::REPEAT_INTENTS)
  end
end

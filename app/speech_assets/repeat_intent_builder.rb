# frozen_string_literal: true

# Class to build utterances for Repeat Intent
class RepeatIntentBuilder < IntentBuilder
  def add
    SampleIntents::REPEAT_INTENTS.map { |sample| intent.add_utterance_template sample }
  end
end

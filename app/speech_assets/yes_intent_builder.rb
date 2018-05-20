# frozen_string_literal: true

# Class to build utterances for Yes Intent
class YesIntentBuilder < IntentBuilder
  def add
    SampleIntents::YES_INTENTS.map { |sample| intent.add_utterance_template sample }
  end
end

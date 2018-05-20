# frozen_string_literal: true

# Class to build utterances for Start over Intent
class StartOverIntentBuilder < IntentBuilder
  def add
    SampleIntents::START_OVER_INTENTS.map { |sample| intent.add_utterance_template sample }
  end
end

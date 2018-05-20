# frozen_string_literal: true

require_relative 'sample_intents'
# Class to build utterances for Help Intent
class HelpIntentBuilder < IntentBuilder
  def add
    SampleIntents::HELP_INTENTS.map { |sample| intent.add_utterance_template sample }
  end
end

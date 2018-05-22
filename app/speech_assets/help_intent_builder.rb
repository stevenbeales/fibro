# frozen_string_literal: true

require_relative 'sample_intents'
# Class to build utterances for Help Intent
class HelpIntentBuilder < IntentBuilder
  def add
    add_intents(SampleIntents::HELP_INTENTS)
  end
end

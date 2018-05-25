# frozen_string_literal: true

# Class to build utterances for Start over Intent
class StartOverIntentBuilder < IntentBuilder
  START_OVER_INTENTS = [
    'Go home',
    'Go to home',
    'Home',
    'Re-start',
    'Start',
    'Start over',
    'Start again'
  ].freeze

  def add
    add_intents(START_OVER_INTENTS)
  end
end

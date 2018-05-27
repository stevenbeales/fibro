# frozen_string_literal: true

# Class to build utterances for No Intent
class NoIntentBuilder < IntentBuilder
  NO_INTENTS = [
    'Nah',
    'Nein',
    'No',
    'Non',
    'No thanks',
    'No way',
    'Nyet'
  ].freeze

  def add
    add_intents(NO_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build utterances for No Intent
class NoIntentBuilder < IntentBuilder
  NO_INTENTS = [
    'Absolutely not',
    'By no means',
    'Ixnay',
    'Most certainly not',
    'Nah',
    'Negative',
    'Nein',
    'Never',
    'No',
    'Non',
    'No thanks',
    'No way',
    'No way Jose',
    'Not at all',
    'Not on your life',
    'Nyet',
    'Of course not',
    'Uh-uh',
    'Under no circumstances'
  ].freeze

  def add
    add_intents(NO_INTENTS)
  end
end

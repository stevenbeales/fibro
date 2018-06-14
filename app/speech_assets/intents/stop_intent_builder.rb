# frozen_string_literal: true

# Class to build utterances for Stop Intent
class StopIntentBuilder < IntentBuilder
  STOP_INTENTS = [
    'Adios',
    'Arrivederci',
    'Au Revoir',
    'Auf Wiedersehn',
    'Goodbye',
    'Good-bye',
    'No mas',
    'No more',
    'Off',
    'Shut up',
    'Stop'
  ].freeze

  def add
    add_intents(STOP_INTENTS)
  end
end

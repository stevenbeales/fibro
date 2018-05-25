# frozen_string_literal: true

# Class to build utterances for Repeat Intent
class RepeatIntentBuilder < IntentBuilder
  REPEAT_INTENTS = [
    'Again',
    'Can you repeat that',
    'One more time',
    'Repeat',
    'Repeat again',
    'Say again',
    'What are you asking about'
  ].freeze

  def add
    add_intents(REPEAT_INTENTS)
  end
end

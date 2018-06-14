# frozen_string_literal: true

# Class to build utterances for Repeat Intent
class RepeatIntentBuilder < IntentBuilder
  REPEAT_INTENTS = [
    'Again',
    'Another time',
    'Can you repeat that',
    'Do again',
    'Once more',
    'One more time',
    'Repeat',
    'Repeat again',
    'Repeat that',
    'Say again',
    'Say that again',
    'What are you asking about'
  ].freeze

  def add
    add_intents(REPEAT_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build Condition Intent
class ConditionIntentBuilder < IntentBuilder
  CONDITION_INTENTS = [
    '{Condition}',
    'talk about {Condition}',
    'tell me about {Condition}',
    'tell me symptoms of {Condition}',
    'tell me the symptoms of {Condition}',
    'tell me the treatment of {Condition}',
    'tell me some details about {Condition}'
  ].freeze

  def add
    add_slot(:Condition, :LIST_OF_CONDITIONS) do |slot|
      slot.add_bindings('Fibromyalgia', 'Fibro')
    end

    add_intents(CONDITION_INTENTS)
  end
end

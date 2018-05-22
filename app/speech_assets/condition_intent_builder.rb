# frozen_string_literal: true

# Class to build Condition Intent
class ConditionIntentBuilder < IntentBuilder
  def add
    add_slot(:Condition, :LIST_OF_CONDITIONS) do |slot|
      slot.add_bindings('Fibromyalgia', 'Fibro')
    end

    add_intents(SampleIntents::CONDITION_INTENTS)
  end
end

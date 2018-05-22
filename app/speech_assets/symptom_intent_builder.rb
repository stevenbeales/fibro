# frozen_string_literal: true

# Class to build Symptom Intent
class SymptomIntentBuilder < IntentBuilder
  def add
    add_slot(:Symptom, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings(SampleIntents::SYMPTOM_SLOTS)
    end

    add_intents(SampleIntents::SYMPTOM_INTENTS)
  end
end

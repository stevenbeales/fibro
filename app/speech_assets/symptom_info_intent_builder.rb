# frozen_string_literal: true

# Class to build Symptom Information Intent
class SymptomInfoIntentBuilder < IntentBuilder
  def add
    add_slot(:SymptomInfo, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings(SampleIntents::SYMPTOM_SLOTS)
    end

    add_intents(SampleIntents::SYMPTOM_INFO_INTENTS)
  end
end

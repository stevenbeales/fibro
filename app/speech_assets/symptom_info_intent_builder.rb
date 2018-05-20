# frozen_string_literal: true

# Class to build Symptom Information Intent
class SymptomInfoIntentBuilder < IntentBuilder
  def add
    add_slot(:SymptomInfo, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings(SampleIntents::SYMPTOM_SLOTS)
    end

    SampleIntents::SYMPTOM_INFO_INTENTS.each { |sample| intent.add_utterance_template sample }
  end
end

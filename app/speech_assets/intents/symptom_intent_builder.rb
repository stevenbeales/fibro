# frozen_string_literal: true

# Class to build Symptom Intent
class SymptomIntentBuilder < IntentBuilder
  SYMPTOM_INTENTS = [
    'I feel {Symptom}',
    'I am feeling {Symptom}',
    'I am {Symptom}',
    'I {Symptom}',
    '{Symptom}',
    'I think I may have {Symptom}',
    'I think I might have {Symptom}',
    'I have {Symptom}'
  ].freeze

  def add
    add_slot(:Symptom, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings(SlotSamples::SYMPTOM_SLOTS)
    end

    add_intents(SYMPTOM_INTENTS)
  end
end

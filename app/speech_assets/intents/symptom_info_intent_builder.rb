# frozen_string_literal: true

# Class to build Symptom Information Intent
class SymptomInfoIntentBuilder < IntentBuilder
  SYMPTOM_INFO_INTENTS = [
    'Get result for {Symptom}',
    'what does it mean if I have {Symptom}',
    'What does it mean to have {Symptom}',
    'Should I be worried if I have {Symptom}',
    'Should I be worried if I am {Symptom}',
    'What if I feel {Symptom}',
    'What are feelings of {Symptom}',
    'Should I go to the doctor if I have {Symptom}',
    'Should I go to the doctor if {Symptom}',
    'Should I be scared if {Symptom}',
    'What could {Symptom} mean',
    'I have {Symptom} what does it mean',
    'Can you tell me about {Symptom}',
    'What is linked to {Symptom}',
    'Do you know anything about {Symptom}',
    'What relates to {Symptom}',
    'What if I have {Symptom}',
    'What could {Symptom} mean',
    'If I feel {Symptom} should I be worried',
    'If I feel {Symptom} what could it be',
    'What are the most popular diagnosis that cause {Symptom}',
    'Will I die if {Symptom}',
    'Is {Symptom} fatal',
    'Could untreated {Symptom} be fatal'
  ].freeze

  def add
    add_slot(:SymptomInfo, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings(SlotSamples::SYMPTOM_SLOTS)
    end

    add_intents(SYMPTOM_INFO_INTENTS)
  end
end

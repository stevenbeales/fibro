# frozen_string_literal: true

# Class to build Symptom Information Intent
class SymptomInfoIntentBuilder < IntentBuilder
  SYMPTOM_INFO_INTENTS = [
    'Get result for {SymptomInfo}',
    'What does it mean if I have {SymptomInfo}',
    'What does it mean to have {SymptomInfo}',
    'Should I be worried if I have {SymptomInfo}',
    'Should I be worried if I am {SymptomInfo}',
    'What if I feel {SymptomInfo}',
    'What are feelings of {SymptomInfo}',
    'Should I go to the doctor if I have {SymptomInfo}',
    'Should I go to the doctor if {SymptomInfo}',
    'Should I be scared if {SymptomInfo}',
    'What could {SymptomInfo} mean',
    'I have {SymptomInfo} what does it mean',
    'Can you tell me about {SymptomInfo}',
    'What is linked to {SymptomInfo}',
    'Do you know anything about {SymptomInfo}',
    'What relates to {SymptomInfo}',
    'What if I have {SymptomInfo}',
    'What could {SymptomInfo} mean',
    'If I feel {SymptomInfo} should I be worried',
    'If I feel {SymptomInfo} what could it be',
    'What are the most popular diagnosis that cause {SymptomInfo}',
    'Will I die if {SymptomInfo}',
    'Is {SymptomInfo} fatal',
    'Could untreated {SymptomInfo} be fatal'
  ].freeze

  def add
    add_slot(:SymptomInfo, :SYMPTOMINFO) do |slot|
      slot.add_bindings(SlotSamples::SYMPTOM_SLOTS)
    end

    add_intents(SYMPTOM_INFO_INTENTS)
  end
end

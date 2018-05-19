# frozen_string_literal: true

# Class to build Symptom Information Intent
class SymptomInfoIntentBuilder < IntentBuilder
  def add
    add_slot(:SymptomInfo, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings('Fatigue', 'Pain', 'Fogginess', 'Memory', 'Poor Sleep', 'Depression', 'Mood Change',
                        'Eyes', 'Light Sensitivity', 'Abdominal Pain', 'Dizzy', 'Balance Problems', 'Headache',
                        'Joint Pain', 'Lymph Node Tenderness', 'Sore Throat', 'Other')
    end

    SampleIntents::SYMPTOM_INFO_INTENTS.each { |sample| intent.add_utterance_template sample }
  end
end

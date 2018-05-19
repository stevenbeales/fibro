# frozen_string_literal: true

# Class to build Symptom Intent
class SymptomIntentBuilder < IntentBuilder
  def add
    add_slot(:Symptom, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings('Fatigue', 'Pain', 'Fogginess', 'Memory', 'Poor Sleep', 'Depression', 'Mood Change',
                        'Eyes', 'Light Sensitivity', 'Abdominal Pain', 'Dizzy', 'Balance Problems', 'Headache',
                        'Joint Pain', 'Lymph Node Tenderness', 'Sore Throat', 'Other')
    end

    SampleIntents::SYMPTOM_INTENTS.each { |sample| intent.add_utterance_template sample }
  end
end

# frozen_string_literal: true

# Class to build Symptom Intent
class SymptomIntentBuilder < IntentBuilder
  def add
    intent.add_slot(:Symptom, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings('Fatigue', 'Pain', 'Fogginess', 'Memory', 'Poor Sleep', 'Depression', 'Mood Change',
                        'Eyes', 'Light Sensitivity', 'Abdominal Pain', 'Dizzy', 'Balance Problems', 'Headache',
                        'Joint Pain', 'Lymph Node Tenderness', 'Sore Throat', 'Other')
    end

    intent.add_utterance_template('I feel {Symptom}')
    intent.add_utterance_template('I am feeling {Symptom}')
    intent.add_utterance_template('I am {Symptom}')
    intent.add_utterance_template('I {Symptom}')
    intent.add_utterance_template('{Symptom}')
    intent.add_utterance_template('I think I may have {Symptom}')
    intent.add_utterance_template('I think I might have {Symptom}')
    intent.add_utterance_template('I have {Symptom}')
  end
end

# frozen_string_literal: true

# Class to build Symptom Intent
class SymptomIntentBuilder < IntentBuilder
  def add
    intent.add_slot(:Symptom, :LIST_OF_SYMPTOMS) do |slot|
      slot.add_bindings('Fatigue', 'Pain', 'Fogginess', 'Memory', 'Poor Sleep', 'Depression', 'Mood Change',
                        'Eyes', 'Light Sensitivity', 'Abdominal Pain', 'Dizzy', 'Balance Problems', 'Headache',
                        'Joint Pain', 'Lymph Node Tenderness', 'Sore Throat', 'Other')
    end

    intent.add_utterance_template('Get result for {Symptom}')
    intent.add_utterance_template('what does it mean if I have {Symptom}')
    intent.add_utterance_template('What does it mean to have {Symptom}')
    intent.add_utterance_template('Should I be worried if I have {Symptom}')
    intent.add_utterance_template('Should I be worried if I am {Symptom}')
    intent.add_utterance_template('I feel {Symptom}')
    intent.add_utterance_template('I am feeling {Symptom}')
    intent.add_utterance_template('What if I feel {Symptom}')
    intent.add_utterance_template('What are feelings of {Symptom}')
    intent.add_utterance_template('Should I go to the doctor if I have {Symptom}')
    intent.add_utterance_template('Should I go to the doctor if {Symptom}')
    intent.add_utterance_template('Should I be scared if {Symptom}')
    intent.add_utterance_template('What could {Symptom} mean')
    intent.add_utterance_template('I am {Symptom}')
    intent.add_utterance_template('I {Symptom}')
    intent.add_utterance_template('{Symptom}')
    intent.add_utterance_template('I have {Symptom} what does it mean')
    intent.add_utterance_template('Can you tell me about {Symptom}')
    intent.add_utterance_template('What is linked to {Symptom}')
    intent.add_utterance_template('Do you know anything about {Symptom}')
    intent.add_utterance_template('What relates to {Symptom}')
    intent.add_utterance_template('I think I may have {Symptom}')
    intent.add_utterance_template('I think I might have {Symptom}')
    intent.add_utterance_template('I have {Symptom}')
    intent.add_utterance_template('What if I have {Symptom}')
    intent.add_utterance_template('What could {Symptom} mean')
    intent.add_utterance_template('If I feel {Symptom} should I be worried')
    intent.add_utterance_template('If I feel {Symptom} what could it be')
    intent.add_utterance_template('What are the most popular diagnosis that cause {Symptom}')
    intent.add_utterance_template('Will I die if {Symptom}')
    intent.add_utterance_template('Is {Symptom} fatal')
    intent.add_utterance_template('Could untreated {Symptom} be fatal')
  end
end

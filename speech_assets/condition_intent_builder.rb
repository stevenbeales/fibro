# frozen_string_literal: true

# Class to build Condition Intent
class ConditionIntentBuilder < IntentBuilder
  def add
    intent.add_slot(:Condition, :LIST_OF_CONDITIONS) do |slot|
      slot.add_bindings('Fibromyalgia', 'Fibro')
    end
    intent.add_utterance_template('{Condition}')
    intent.add_utterance_template('tell me about {Condition}')
    intent.add_utterance_template('talk about {Condition}')
    intent.add_utterance_template('tell me symptoms of {Condition}')
    intent.add_utterance_template('tell me the symptoms of {Condition}')
    intent.add_utterance_template('tell me the treatment of {Condition}')
    intent.add_utterance_template('tell me some details about {Condition}')
  end
end

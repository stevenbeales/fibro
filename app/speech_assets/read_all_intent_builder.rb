# frozen_string_literal: true

# Class to build ReadAll Intent
class ReadAllIntentBuilder < IntentBuilder
  def add
    add_slot(:Read, :READ) do |slot|
      slot.add_bindings('read', 'speak')
    end
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings('log', 'journal', 'diary', 'symptom log')
    end

    SampleIntents::READ_ALL_INTENTS.map { |sample| intent.add_utterance_template sample }
  end
end

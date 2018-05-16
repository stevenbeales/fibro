# frozen_string_literal: true

# Class to build ReadEntry Intent
class ReadEntryIntentBuilder < IntentBuilder
  def add
    add_slot(:Day, AlexaGenerator::Slot::SlotType::DATE)
    add_slot(:Read, :READ) do |slot|
      slot.add_bindings('read', 'speak')
    end
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings('log', 'journal', 'diary', 'symptom log')
    end
    add_slot(:Entry, :ENTRY) do |slot|
      slot.add_bindings('entry', 'event')
    end
    intent.add_utterance_template('{Read} {Log} for {Day}')
    intent.add_utterance_template('Get {Entry} for {Day}')
    intent.add_utterance_template('Give me {Entry} for {Day}')
    intent.add_utterance_template('What happened on {Day}')
    intent.add_utterance_template('{Read} {Day}')
  end
end

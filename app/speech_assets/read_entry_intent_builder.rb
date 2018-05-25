# frozen_string_literal: true

# Class to build ReadEntry Intent
class ReadEntryIntentBuilder < IntentBuilder
  READ_ENTRY_INTENTS = [
    '{Read} {Log} for {Day}',
    'Get {Entry} for {Day}',
    'Give me {Entry} for {Day}',
    'What happened on {Day}',
    '{Read} {Day}'
  ].freeze

  def add
    add_slot(:Day, AlexaGenerator::Slot::SlotType::DATE)
    add_slot(:Read, :READ) do |slot|
      slot.add_bindings(Samples::READ_SLOTS)
    end
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings(Samples::LOG_SLOTS)
    end
    add_slot(:Entry, :ENTRY) do |slot|
      slot.add_bindings(Samples::ENTRY_SLOTS)
    end

    add_intents(READ_ENTRY_INTENTS)
  end
end

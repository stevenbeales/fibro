# frozen_string_literal: true

# Class to build DeleteEntry Intent
class DeleteEntryIntentBuilder < IntentBuilder
  DELETE_ENTRY_INTENTS = [
    'Delete {Log} {Entry}',
    'Delete {Entry}'
  ].freeze

  def add
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings(SlotSamples::LOG_SLOTS)
    end
    add_slot(:Entry, :ENTRY) do |slot|
      slot.add_bindings(SlotSamples::ENTRY_SLOTS)
    end

    add_intents(DELETE_ENTRY_INTENTS)
  end
end

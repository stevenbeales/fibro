# frozen_string_literal: true

# Class to build NextEntry Intent
class NextEntryIntentBuilder < IntentBuilder
  NEXT_ENTRY_INTENTS = [
    'Next {Log} {Entry}',
    'Next {Entry}'
  ].freeze

  def add
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings(SlotSamples::LOG_SLOTS)
    end
    add_slot(:Entry, :ENTRY) do |slot|
      slot.add_bindings(SlotSamples::ENTRY_SLOTS)
    end

    add_intents(NEXT_ENTRY_INTENTS)
  end
end

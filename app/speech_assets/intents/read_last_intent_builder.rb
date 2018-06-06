# frozen_string_literal: true

# Class to build ReadLast Intent
class ReadLastIntentBuilder < IntentBuilder
  READ_LAST_INTENTS = [
    '{Read} last {Log}',
    '{Read} last {n}',
    '{Read} last',
    '{Read} last {n} {Log}'
  ].freeze

  def add
    add_slot(:Read, :READ) do |slot|
      slot.add_bindings(SlotSamples::READ_SLOTS)
    end
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings(SlotSamples::LOG_SLOTS)
    end
    add_slot(:n, AlexaGenerator::Slot::SlotType::NUMBER)

    add_intents(READ_LAST_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build ReadLast Intent
class ReadLastIntentBuilder < IntentBuilder
  def add
    add_slot(:Read, :READ) do |slot|
      slot.add_bindings('read', 'speak')
    end
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings('log', 'journal', 'diary', 'symptom log')
    end
    add_slot(:n, AlexaGenerator::Slot::SlotType::NUMBER)

    add_intents(SampleIntents::READ_LAST_INTENTS)
  end
end

# frozen_string_literal: true

# Class to build ReadAll Intent
class ReadAllIntentBuilder < IntentBuilder
  READ_ALL_INTENTS = [
    '{Read} {Log}',
    'What happened',
    '{Read} all',
    '{Read} everything'
  ].freeze

  def add
    add_slot(:Read, :READ) do |slot|
      slot.add_bindings(Samples::READ_SLOTS)
    end
    add_slot(:Log, :LOG) do |slot|
      slot.add_bindings(Samples::LOG_SLOTS)
    end

    add_intents(READ_ALL_INTENTS)
  end
end

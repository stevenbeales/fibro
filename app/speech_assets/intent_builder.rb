# frozen_string_literal: true

# Abstract class to build custom intents
class IntentBuilder
  attr_reader :intent
  attr_reader :builder

  def initialize(intent)
    @intent = intent
  end

  def add
    raise NotImplementedError
  end

  def add_slot(name, type, &block)
    intent.add_slot(name, type, &block)
  end
end

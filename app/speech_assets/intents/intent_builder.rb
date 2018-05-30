# frozen_string_literal: true

# Abstract class to provide base methods used in building custom Alexa intents for voice user interfaces
class IntentBuilder
  include Concord.new(:intent)

  def add
    raise NotImplementedError
  end

  def add_slot(name, type, &block)
    intent.add_slot(name, type, &block)
  end

  protected

  def add_intents(intents)
    intents.map { |sample| intent.add_utterance_template sample }
  end
end

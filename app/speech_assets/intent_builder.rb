# frozen_string_literal: true

# Abstract class to build custom intents
class IntentBuilder
  attr_reader :intent

  def initialize(intent)
    @intent = intent
  end

  def add
    raise NotImplementedError
  end
end

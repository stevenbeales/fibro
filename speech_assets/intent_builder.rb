# frozen_string_literal: true

# Class to build custom intents
class IntentBuilder
  attr_reader :intent

  def initialize(intent)
    @intent = intent
  end

  def add
    raise NotImplementedError
  end
end

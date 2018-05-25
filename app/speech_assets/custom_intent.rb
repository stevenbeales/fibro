# frozen_string_literal: true

# Class to build Custom Intent within Interaction Model Builder
class CustomIntent
  attr_reader :model
  attr_reader :key
  attr_reader :value

  def initialize(model, key, value)
    @model = model
    @key = key
    @value = value
  end

  def add
    model.add_intent(key) do |intent|
      add_value(intent)
    end
  end

  private

  def add_value(intent)
    value.new(intent).add
  end
end

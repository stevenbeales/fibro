# frozen_string_literal: true

# Class to build Custom Intent within Interim Model Builder
class CustomIntent
  include Concord.new(:model, :key, :value)

  def add
    model.add_intent(key) { |intent| add_value(intent) }
  end

  private

  def add_value(intent)
    value.new(intent).add
  end
end

# frozen_string_literal: true

# Class to build Custom Intent within Interim Model Builder
class CustomIntent
  include Concord.new(:model, :key, :value)

  # Add self to interim model by key 
  def add
    model.add_intent(key) { |intent| add_value(intent) }
  end

  protected

  def add_value(intent)
    value.new(intent).add
  end
end

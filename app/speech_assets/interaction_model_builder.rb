# frozen_string_literal: true

# Builds interaction Model
class InteractionModelBuilder
  attr_reader :builder_class
  attr_reader :custom_intents
  attr_reader :amazon_intents

  def initialize(builder_class:, custom_intents:, amazon_intents:)
    @builder_class = builder_class
    @custom_intents = custom_intents
    @amazon_intents = amazon_intents
  end

  def model
    @model ||= generate
  end

  private

  def add(value, intent)
    value.new(intent).add
  end

  def generate
    @model = builder_class.build do |modl|
      custom_intents.each do |key, value|
        modl.add_intent(key) do |intent|
          add(value, intent)
        end
      end
      amazon_intents.each do |key, value|
        modl.add_intent(%(AMAZON.#{key}Intent)) do |intent|
          add(value, intent)
        end
      end
    end
  end
end

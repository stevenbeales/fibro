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

  def add_intents(modl, klass, intents)
    intents.each do |key, value|
      intent = klass.new(modl, key, value)
      intent.add
    end
  end

  def generate
    @model = builder_class.build do |modl|
      add_intents(modl, CustomIntent, @custom_intents)
      add_intents(modl, AmazonIntent, @amazon_intents)
    end
  end
end

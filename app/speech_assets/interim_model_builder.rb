# frozen_string_literal: true

# Builds interaction Model in Amazon Alexa 1.0 format
class InterimModelBuilder
  include Concord.new(:builder_class, :custom_intents, :amazon_intents)
 
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

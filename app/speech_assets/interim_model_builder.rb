# frozen_string_literal: true

# Builds interaction Model in Amazon Alexa 1.0 format
class InterimModelBuilder
  include Concord.new(:builder_class, :custom_intents, :amazon_intents)
 
  def model
    @model ||= build_model
  end

  def custom_intent_types
    intents.select { |_name, intent| intent.slots.size.positive? }
           .uniq { |key, _value| key }
  end

  def intents
    model.intents
  end

  protected

  def add_intents(modl, klass, intents)
    intents.each do |key, value|
      intent = klass.new(modl, key, value)
      intent.add
    end
  end

  def build_model
    @model = builder_class.build do |modl|
      add_intents(modl, CustomIntent, @custom_intents)
      add_intents(modl, AmazonIntent, @amazon_intents)
    end
  end
end

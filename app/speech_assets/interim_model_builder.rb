# frozen_string_literal: true

# Builds interaction Model in Amazon Alexa 1.0 format
class InterimModelBuilder
  include Concord.new(:builder_class, :custom_intents, :amazon_intents)
  delegate :intents, to: :model
 
  # Model generated in Alexa 1.0 format using Alexa Generator gem
  def model
    @model ||= build_model
  end

  # Returns unique intent types that have slots. Amazon types cannot have slots.    
  # Note: This will not include a custom type without a custom slot
  def custom_intent_types
    intents.select { |_name, intent| intent.slots.size.positive? }
           .uniq { |key, _value| key }
  end

  protected

  # Called by build model to add all intents to interaction model
  def add_intents_to_model(modl, klass, intents)
    intents.each do |key, value|
      intent = klass.new(modl, key, value)
      intent.add
    end
  end

  # Add Custom Intents and Amazon Intents and build Alexa 1.0 interaction format
  def build_model
    @model = builder_class.build do |modl|
      add_intents_to_model(modl, CustomIntent, @custom_intents)
      add_intents_to_model(modl, AmazonIntent, @amazon_intents)
    end
  end
end

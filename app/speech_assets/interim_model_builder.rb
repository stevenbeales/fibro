# frozen_string_literal: true

# Builds interaction Model in Amazon Alexa 1.0 format
class InterimModelBuilder
  include Concord.new(:builder_class, :custom_intents, :amazon_intents)
 
  def model
    @model ||= generate
  end

  # Return lists of intents based on Alexa 1.0 JSON schema
  def json_intents
    @json_intents ||= JSON.parse(json_model, symbolize_names: true)[:interactionModel][:languageModel][:intents]
  end
   
  def types_by_name
    model.collect_slot_types.reject { |_key, value| value.include?('AMAZON') }.uniq { |_key, value| value }
  end

  protected

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

  def json_model
    JsonFileOutput.new(model.intent_schema).output_model
  end
end

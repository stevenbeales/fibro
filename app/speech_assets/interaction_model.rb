# frozen_string_literal: true

using IntentRefinements

# Combines Schema in Amazon Alexa 1.0 format with Samples to build schema in Alexa 2.0 format
class InteractionModel
  include Concord.new(:interim_model_builder, :utterance_model)

  def save(filename)
    JsonFileOutput.new(intent_schema).save(filename)
  end

  def intent_schema
    intents_by_name = []
    utterance_model.sample_values.map { |intent| add_intents_by_name(intents_by_name, intent) } 
    { intents: intents_by_name, types: custom_types_by_name }
  end

  protected 

  def add_intents_by_name(intents_by_name, intent)
    return intents_by_name << { intent: intent.name, samples: intent.samples } unless intent.slots.any?
     
    slots = []
    intent.slots.map { |slot| slots << { name: slot.name, type: slot.type } }
    intents_by_name << { intent: intent.name, slots: slots, samples: intent.samples }
  end

  def custom_types_by_name
    interim_model_builder.intents \
                         .select { |_name, intent| intent.slots.size.positive? }
                         .map { |_name, intent| custom_types_for(intent) }
                         .uniq { |key, _value| key }
  end

  def custom_types_for(intent)
    intent.slots.map { |slot| { name: slot.name, values: slot.bindings } }
  end
end

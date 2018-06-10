# frozen_string_literal: true

using IntentRefinements

# Combines schema in Amazon Alexa 1.0 format with samples to build schema in Alexa 2.0 format
class InteractionModel
  include Concord.new(:interim_model_builder, :utterance_model)

  # Save to JSON file in current Alexa interaction file format
  def save(filename)
    JsonFileOutput.new(intent_schema).save(filename)
  end

  # Build intent schema in Alexa 2.0 format with custom types
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
    interim_model_builder.custom_intent_types                
                         .map { |_name, intent| hash_wrap(intent.custom_types_for) }
                         .flatten.uniq { |key, _val| key }
  end

  private

  # Helper method to put our custom types in correct format for Alexa
  def hash_wrap(custom_types)
    wrap_in_name_values_hash(wrap_in_name_hash(custom_types))
  end

  def slot_name_from(names)
    names[:name][:value].to_s.upcase
  end

  def wrap_in_name_hash(value_synonyms_array)
    value_synonyms_array.map do |value_synonyms| 
      result = {} 
      result[:name] = value_synonyms
      result
    end 
  end

  def wrap_in_name_values_hash(name_array)
    result = []
    name_array.each { |name| result << { name: slot_name_from(name), values: [name] } }
    result
  end
end

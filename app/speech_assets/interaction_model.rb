# frozen_string_literal: true

# Add refinements to support Alexa 2.0 interaction json format
using IntentRefinements

# Combines schema in Amazon Alexa 1.0 format with samples to build schema in Alexa 2.0 format
class InteractionModel
  include Concord.new(:interim_model_builder, :utterance_model)

  # Save to JSON file in current Alexa 2.0 interaction file format
  def save(filename)
    JsonFileOutput.new(intent_schema).save(filename)
  end

  # Build intent schema in Alexa 2.0 interaction format including Custom Types instead of Literals
  def intent_schema
    intents_by_name = []
    utterance_model.sample_values.map { |intent| add_intents_by_name(intents_by_name, intent) } 
    { intents: intents_by_name, types: custom_types_by_name }
  end

  protected 

  # Add intents formatted in Alexa 2.0 interaction json file format 
  def add_intents_by_name(intents_by_name, intent)
    return intents_by_name << { intent: intent.name, samples: intent.samples } unless intent.slots.any?
     
    slots = []
    intent.slots.map { |slot| slots << { name: slot.name, type: slot.type } }
    intents_by_name << { intent: intent.name, slots: slots, samples: intent.samples }
  end

  # Get unique custom types formatted for Alexa 2.0 interaction json files
  def custom_types_by_name
    interim_model_builder.custom_intent_types                
                         .map { |_name, intent| format_for_alexa(intent.custom_types_for) }
                         .flatten
                         .uniq { |key, _val| key }
  end

  private

  # Helper method to put our custom types in correct format for Alexa 2.0 interaction json files
  def format_for_alexa(custom_types)
    wrap_in_name_values_hash(wrap_in_name_hash(custom_types))
  end

  # Use upcased version of slot name for Custom Type name
  def type_name_from_slot(slot_name)
    slot_name[:name][:value].to_s.upcase
  end

  # We need to wrap our Custom Types in a { name: { value: , synonyms: [] } } hash 
  # for Alexa 2.0 interaction json format
  def wrap_in_name_hash(custom_types_array)
    custom_types_array.map do |custom_type| 
      name_hash = {} 
      name_hash[:name] = custom_type
      name_hash
    end 
  end
 
  # We need to wrap name hash in a [name: , values: [name_hash]] array for Alexa 2.0 interaction json format
  def wrap_in_name_values_hash(name_hash_array)
    name_values_hash_array = []
    name_hash_array.each do |name_hash| 
      name_values_hash_array << { name: type_name_from_slot(name_hash), values: [name_hash] } 
    end
    name_values_hash_array
  end
end

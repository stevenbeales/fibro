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
    interim_model_builder.custom_intent_types                
                         .map { |_name, intent| hash_wrap(intent.custom_types_for) }
  end

  private

  # Helper method to put our custom types in correct format for Alexa
  def hash_wrap(custom_types)
    wrap_in_name_values_hash(wrap_in_name_hash(custom_types))
  end

  def slot_name_from(name_hash)
    name_hash[:name][:value].to_s.upcase
  end

  def wrap_in_name_hash(value_synonyms_array)
    Hash[value_synonyms_array.map { |value_synonyms| [:name, value_synonyms] }] 
  end

  def wrap_in_name_values_hash(name_hash)
    Hash[:name, slot_name_from(name_hash), :values, [name_hash]]
  end
end

# frozen_string_literal: true

require './lib/refinements/intent_refinements'
using IntentRefinements

# Combines Schema in Amazon Alexa 1.0 format with Samples to build schema in Alexa 2.0 format
class JsonInteractionModel
  include Concord.new(:utterance_model, :interaction_model)
  include JsonFileOutput
  
  protected 

  def add_intents(intents, intent)
    if intent.slots.any?
      slots = []
      intent.slots.each { |slot| slots << { name: slot.name, type: slot.type } }
      intents << { intent: intent.name, slots: slots, samples: intent.samples }
    else
      intents << { intent: intent.name, samples: intent.samples }
    end
  end

  def combined_samples
    sample_array = []

    utterance_model.model.intents.each_with_index do |intent, index|
      sample_array.concat([intent[1].add_samples(samples, index)])
    end

    Hash[sample_array.map { |intent| [intent.name, intent] }]
  end

  def intent_schema
    intents = []
    intents_plus_samples.values.each { |intent| add_intents(intents, intent) } 
    { intents: intents }
  end
  
  def intents_plus_samples
    @intents_plus_samples ||= combined_samples
  end

  # returns a list of sample utterances in format: [Intent] [Sample] e.g. ConditionIntent talk about {Condition}
  def samples
    samples = []
    json_intents.each { |intent| samples.concat([utterance_model.sample_from_intent(intent[:intent])]) }
    samples
  end
end

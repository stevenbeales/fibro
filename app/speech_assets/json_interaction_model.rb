# frozen_string_literal: true

require './lib/refinements/intent_refinements'
require './lib/refinements/string_refinements'

# add indent methods to string
using StringRefinements
using IntentRefinements

# Combines Schema in Amazon Alexa 1.0 format with Samples to build schema in Alexa 2.0 format
class JsonInteractionModel
  def initialize(utterance_model:, interaction_model:)
    @intents = interaction_model.intents
    @utterance_model = utterance_model
    @intents_plus_samples = {}
  end

  # returns a list of sample utterances in format: [Intent] [Sample] e.g. ConditionIntent talk about {Condition}
  def samples
    samples = []
    @intents.each { |intent| samples.concat([sample_from_intent(intent[:intent])]) }
    samples
  end

  def save(filename)
    JsonFileOutput.new(intent_schema, filename)
  end

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

  def combine_samples
    sample_array = []

    @utterance_model.intents.each_with_index do |intent, index|
      sample_array.concat([intent[1].add_samples(samples, index)])
    end

    Hash[@intents_plus_samples.map { |intent| [intent.name, intent] }]
  end

  def intents_plus_samples
    return @intents_plus_samples if @intents_plus_samples.size.positive?
 
    @intents_plus_samples = combine_samples
  end

  def indifferent_access(intent)
    return intent if intent.include?('AMAZON') 
   
    intent.to_sym
  end
 
  def sample_from_intent(intent)
    # the sample utterance is taken from the model.sample_utterances list but Amazon and Custom intents  
    # are indexed with strings or symbols respectively so we call indifferent_access to access the samples. 
    
    @utterance_model.sample_utterances(indifferent_access(intent))
  end

  def intent_schema
    intents = []
    intents_plus_samples.values.each { |intent| add_intents(intents, intent) } 
    { intents: intents }
  end
end

# frozen_string_literal: true

require './lib/refinements/intent_refinements'
using IntentRefinements

# Class to generate sample utterances file
class UtterancesModel
  attr_reader :model
 
  def initialize(model)
    @model = model
  end

  def intents_with_samples
    sample_array = []
    model.intents.each_with_index do |generator_intent, index|
      sample_array.concat([generator_intent[1].add_samples(samples, index)])
    end
    Hash[sample_array.map { |intent| [intent.name, intent] }]
  end
  
  def describe
    model.intents.map do |intent, _value|
      yield model.sample_utterances(intent) if block_given?
    end
  end

  def save(filename)
    File.open(filename, 'w+') do |line|
      describe { |sample| line.puts sample }
    end
  end

  protected  
  
  def indifferent_access(intent)
    return intent if intent.include?('AMAZON') 
 
    intent.to_sym
  end

  # Return lists of intents based on Alexa 1.0 JSON schema
  def interim_intents
    @interim_intents ||= JSON.parse(interim_model, symbolize_names: true)[:interactionModel][:languageModel][:intents]
  end

  def interim_model
    JsonFileOutput.new(model.intent_schema).output_model
  end
  
  def sample_from_intent(intent)
    # the sample utterance is taken from the model.sample_utterances list but Amazon and Custom intents  
    # are indexed with strings or symbols respectively so we call indifferent_access to access the samples. 
    model.sample_utterances(indifferent_access(intent))
  end
  
  # returns a list of sample utterances in format: [Intent] [Sample] e.g. ConditionIntent talk about {Condition}
  def samples
    samples = []
    interim_intents.map { |intent| samples.concat([sample_from_intent(intent[:intent])]) }
    samples
  end
end

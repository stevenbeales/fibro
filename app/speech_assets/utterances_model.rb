# frozen_string_literal: true

require './lib/refinements/intent_refinements'
using IntentRefinements

# Class to generate sample utterances file
class UtterancesModel
  def initialize(interim_builder)
    @interim_builder = interim_builder
    @interim_model = interim_builder.model
  end

  def intents_with_samples
    @intents_with_samples ||= build_intents_with_samples
  end

  def sample_values
    intents_with_samples.values
  end
 
  def save(filename)
    File.open(filename, 'w+') do |line|
      describe { |sample| line.puts sample }
    end
  end

  protected  
  
  attr_reader :interim_builder
  attr_reader :interim_model

  def add_samples(generator_intent, index)
    generator_intent.add_samples(samples, index)
  end
  
  def build_intents_with_samples
    sample_array = []
    interim_model.intents.each_with_index do |generator_intent, index|
      sample_array.concat([add_samples(generator_intent[1], index)])
    end
    Hash[sample_array.map { |intent| [intent.name, intent] }]
  end

  def build_samples
    samples = []
    interim_builder.json_intents.map { |intent| samples.concat([intent_utterance(intent[:intent])]) }
    samples
  end

  def describe
    interim_model.intents.map do |intent, _value|
      yield interim_model.sample_utterances(intent) if block_given?
    end
  end

  def intent_utterance(intent)
    # the sample utterance is taken from the model.sample_utterances list but Amazon and Custom intents  
    # are indexed with strings or symbols respectively so we call indifferent_access to access the samples. 
    interim_model.sample_utterances(indifferent_access(intent))
  end
  
  # returns a list of sample utterances in format: [Intent] [Sample] e.g. ConditionIntent talk about {Condition}
  def samples
    @samples ||= build_samples
  end

  private

  def indifferent_access(intent)
    return intent if intent.include?('AMAZON') 
 
    intent.to_sym
  end
end

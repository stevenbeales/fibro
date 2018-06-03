# frozen_string_literal: true

require './lib/refinements/intent_refinements'
using IntentRefinements

# Class to generate sample utterances file
class UtterancesModel
  include Concord.new(:interim_model)

  def intents_with_samples
    @intents_with_samples ||= build_intents_with_samples
  end

  def sample_values
    intents_with_samples.values
  end
 
  def save(filename)
    File.open(filename, 'w+') do |line|
      sample_utterance_by_intent { |sample| line.puts sample }
    end
  end

  protected  
  
  # add_samples to intents using intent refinement method add_samples
  def add_sample_utterances_to(intent)
    intent.add_samples_from(sample_utterances_for(intent))
  end
  
  def build_intents_with_samples
    sample_array = []
    interim_model.intents.each { |_name, intent| sample_array.concat([add_sample_utterances_to(intent)]) }
    Hash[sample_array.map { |intent| [intent.name, intent] }]
  end

  def sample_utterances_for(intent)
    interim_model.sample_utterances(intent.name)
  end

  # Enumerator that passes sample utterances for each intent in turn back to calling block
  def sample_utterance_by_intent
    interim_model.intents.map { |intent, _value| yield interim_model.sample_utterances(intent) if block_given? }
  end
end

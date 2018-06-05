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
    File.open(filename, 'w+') { |line| sample_utterances_by_intent { |utterance| line.puts utterance } }
  end

  protected  
  
  # add_samples to intents - uses intent refinement add_samples
  def add_sample_utterances_to(intent)
    intent.add_samples_from(sample_utterances_for(intent))
  end
  
  # builds a hash of intents with their sample utterances
  def build_intents_with_samples
    intent_samples = []
    interim_model.intents.map { |_name, intent| intent_samples.concat([add_sample_utterances_to(intent)]) }
    Hash[intent_samples.map { |intent| [intent.name, intent] }]
  end

  # find the sample_utterances for an intent
  def sample_utterances_for(intent)
    interim_model.sample_utterances(intent.name)
  end

  # Enumerator that passes sample utterances for each intent in turn back to calling block
  def sample_utterances_by_intent
    interim_model.intents.map { |_name, intent| yield sample_utterances_for(intent) if block_given? }
  end
end

# frozen_string_literal: true

# Class to generate sample utterances file
class UtterancesModel
  attr_reader :model
  attr_reader :intents

  def initialize(model)
    @model = model
  end

  def describe
    model.intents.map do |intent, _value|
      yield model.sample_utterances(intent) if block_given?
    end
  end

  def sample_from_intent(intent)
    # the sample utterance is taken from the model.sample_utterances list but Amazon and Custom intents  
    # are indexed with strings or symbols respectively so we call indifferent_access to access the samples. 
    
    model.sample_utterances(indifferent_access(intent))
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
end

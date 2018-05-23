# frozen_string_literal: true

# Class to generate sample utterances file
class UtterancesModel
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def describe
    model.intents.each do |intent, _value|
      yield model.sample_utterances(intent) if block_given?
    end
  end

  def save(filename)
    File.open(filename, 'w+') do |line|
      describe { |sample| line.puts sample }
    end
  end
end

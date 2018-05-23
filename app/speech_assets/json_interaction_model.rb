# frozen_string_literal: true

require 'json'

# Class to generate JSON Interaction Model
class JsonInteractionModel
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def save(filename)
    File.open(filename, 'w+') do |line|
      line.puts schema
    end
  end

  protected

  def schema
    JSON.pretty_generate(model.intent_schema)
  end
end

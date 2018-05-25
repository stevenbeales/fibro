# frozen_string_literal: true

require 'json'
require './lib/refinements/string_refinements'

# add indent and remove_first_line methods to string
using StringRefinements

# Class to generate JSON Interaction Model
#
# This class takes a generated JSON model in Alexa 1.0 JSON format from 2016
# and then wraps and enhances the output with new 2018 JSON objects
class JsonInteractionModel
  attr_reader :model
  attr_reader :invocation

  # Model is an Alexa 1.0 JSON Object.
  # Invocation is the Alexa Invocation Name.
  def initialize(model, invocation)
    @model = model
    @invocation = invocation
  end

  # Save model to a JSON file
  def save(filename)
    File.open(filename, 'w+') do |line|
      JSON.pretty_generate(
        line.puts(%(#{header}\n#{schema.remove_first_line.indent(4)}\n#{footer}))
      )
    end
  end

  protected

  def footer
    "  }\n}"
  end

  def header
    <<-HEADER
  {
  "interactionModel": {
    "languageModel": {
      "invocationName": "#{invocation}",
    HEADER
      .strip
  end

  def schema
    JSON.pretty_generate(model.intent_schema)
  end
end

# frozen_string_literal: true

require 'json'
require './lib/refinements/string_refinements'

# add indent and remove_first_line methods to string
using StringRefinements

# Class to generate base JSON Interaction Model
#
# This class takes a generated JSON model in Alexa 1.0 JSON format from 2016
# and then wraps and enhances the output with new 2018 JSON objects
class JsonBaseModel
  attr_reader :model

  # Model is an Alexa 1.0 JSON Object.
  # Invocation is the Alexa Invocation Name.
  def initialize(model:)
    @model = model
  end

  def json_model
    %(#{header}\n#{schema.remove_first_line.indent(4)}\n#{footer})
  end

  def intents
    symbolized_model = JSON.parse(json_model, symbolize_names: true)
    symbolized_model[:interactionModel][:languageModel][:intents]
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
      "invocationName": "#{AppConstants::INVOCATION_NAME}",
    HEADER
      .strip
  end

  def schema
    JSON.pretty_generate(model.intent_schema)
  end
end

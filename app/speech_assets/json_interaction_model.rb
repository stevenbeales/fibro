# frozen_string_literal: true

require 'json'
require './lib/refinements/string_refinements'

# add indent and remove_first_line methods to string
using StringRefinements

# Class to generate JSON Interaction Model
class JsonInteractionModel
  attr_reader :model
  attr_reader :invocation

  def initialize(model, invocation)
    @model = model
    @invocation = invocation
  end

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

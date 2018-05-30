# frozen_string_literal: true

require './lib/refinements/string_refinements'

# add indent methods to string
using StringRefinements

# Module contains helper methods for building and saving a JSON interaction class
module JsonFileOutput
  # Return lists of intents based on Alexa 1.0 JSON schema
  def json_intents
    symbolized_model = JSON.parse(json_interim_model, symbolize_names: true)
    symbolized_model[:interactionModel][:languageModel][:intents]
  end

  # Save model to a JSON file in Alexa 2.0 format
  def save(filename)
    File.open(filename, 'w+') do |line|
      JSON.pretty_generate(line.puts(json_model))
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
      "invocationName": "#{AppConstants::INVOCATION_NAME}",
    HEADER
  end

  def interim_schema
    JSON.pretty_generate(interaction_model.intent_schema)
  end

  def json_interim_model
    wrap(interim_schema)
  end

  def json_model
    wrap(schema)
  end

  def schema
    JSON.pretty_generate(intent_schema)
  end

  private

  def wrap(scheme)
    %(#{header}#{scheme.remove_first_line.indent(4)}\n#{footer})
  end
end

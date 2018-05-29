# frozen_string_literal: true

# Module contains helper methods for saving a JSON interaction class
class JsonFileOutput
  def initialize(intent_schema, filename)
    @intent_schema = intent_schema 
    @filename = filename
  end

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

  def json_model
    %(#{header}#{schema.remove_first_line.indent(4)}\n#{footer})
  end

  # Save model to a JSON file
  def save
    File.open(@filename, 'w+') do |line|
      JSON.pretty_generate(
        line.puts(json_model)
      )
    end
  end
  
  def schema
    JSON.pretty_generate(@intent_schema)
  end
end

# frozen_string_literal: true

# add indent methods to string
using StringRefinements

# Class contains helper methods for building and saving a JSON interaction class
class JsonFileOutput
  include Concord.new(:schema)
  
  # Save model to a JSON file in Alexa 2.0 format
  def save(filename)
    File.open(filename, 'w+') { |line| JSON.pretty_generate(line.puts(output_model)) }
  end

  # Wraps a model in Alexa 1.0 format with Alexa 2.0 headers and footers 
  def output_model
    wrap(JSON.pretty_generate(schema))
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

  # Fix any formatting differences between Alexa 1.0 and 2.0 format 
  def wrap(schema)
    %(#{header}#{fix_names_of_intents(schema.remove_first_line.indent(4))}\n#{footer})
  end

  private 
  
  def fix_names_of_intents(schema)
    schema.gsub(/intent/, 'name').gsub('names', 'intents')
  end
end

# frozen_string_literal: true

require './lib/refinements/string_refinements'

# add indent methods to string
using StringRefinements

# Class contains helper methods for building and saving a JSON interaction class
class JsonFileOutput
  include Concord.new(:schema)
  
  # Save model to a JSON file in Alexa 2.0 format
  def save(filename)
    File.open(filename, 'w+') { |line| JSON.pretty_generate(line.puts(output_model)) }
  end

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

  def wrap(schema)
    %(#{header}#{schema.remove_first_line.indent(4)}\n#{footer})
  end
end

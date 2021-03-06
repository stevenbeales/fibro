# frozen_string_literal: true

# Factory class that returns the correct Response Class for a Alexa request
class ResponseFactory
  include ResponseHelpers
  include Concord.new(:echo_request, :echo_response) 
  
  def response
    case @echo_request.intent_name
    when /Read/
      ReadResponse.new(@echo_request, @echo_response).response
    when /Symptom/
      SymptomResponse.new(@echo_request, @echo_response).response
    when /AMAZON/
      AmazonResponse.new(@echo_request, @echo_response).response
    when 'ConditionIntent', 'EverybodyHurtsIntent'
      ConditionResponse.new(@echo_request, @echo_response).response
    when 'DeleteEntryIntent', 'NextEntryIntent'
      WriteResponse.new(@echo_request, @echo_response).response
    else
      help_response
    end
  end
end

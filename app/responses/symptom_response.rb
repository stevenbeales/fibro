# frozen_string_literal: true

# Class to define custom symptom responses to Alexa intent requests
class SymptomResponse < BaseResponse
  def response
    case echo_request.intent_name
    when 'SymptomInfoIntent'
      symptom_info_response
    when 'SymptomIntent'
      symptom_response
    else
      help_response
    end
  end

  private

  def symptom_response
    echo_response.add_attribute("symptom_name", echo_request.slots.symptom)
    echo_response.add_attribute("previous_intent", echo_request.intent_name)
    construct_response_with_arguments :symptom_response, echo_request.slots.symptom
  end

  def symptom_info_response
    echo_response.add_attribute("symptom_info_name", echo_request.slots.symptom_info)
    echo_response.add_attribute("previous_intent", echo_request.intent_name)
    construct_response_with_arguments :symptom_info_response, echo_request.slots.symptom_info
  end
end

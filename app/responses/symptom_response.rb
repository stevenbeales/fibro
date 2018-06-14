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
    construct_response :symptom_response, echo_request.slots.symptom
  end

  def symptom_info_response
    construct_response :symptom_info_response 
  end
end

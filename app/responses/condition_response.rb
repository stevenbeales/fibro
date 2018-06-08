# frozen_string_literal: true

# Class to define custom condition responses to Alexa intent requests
class ConditionResponse < BaseResponse
  def response
    case echo_request.intent_name
    when 'ConditionIntent'
      condition_response
    end
  end

  private

  def condition_response
    construct_response :condition_response
  end
end

# frozen_string_literal: true

# Class to define custom condition responses to Alexa intent requests
class ConditionResponse < BaseResponse
  def response
    case echo_request.intent_name
    when 'ConditionIntent'
      condition_response
    when 'EverybodyHurtsIntent'
      everybody_hurts_response
    end
  end

  private

  def condition_response
    construct_response :condition_response
  end

  def everybody_hurts_response
    construct_response :everybody_hurts_response
  end
end

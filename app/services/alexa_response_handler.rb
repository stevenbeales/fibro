# frozen_string_literal: true

require_relative 'amazon_response'
require_relative 'response_helpers'

# Class to define custom responses to Alexa intent request
class AlexaResponseHandler
  include ResponseHelpers

  def initialize(user, echo_request, response)
    @user = user
    @echo_request = echo_request
    @response = response
  end

  def response
    case @echo_request.intent_name
    when 'ConditionIntent'
      condition_response
    when 'EverybodyHurtsIntent'
      everybody_hurts_response
    when /Read/
      read_response = ReadResponse.new(@echo_request, @response)
      read_response.response
    when /Symptom/
      symptom_response = SymptomResponse.new(@echo_request, @response)
      symptom_response.response
    else
      amazon_response = AmazonResponse.new(@echo_request, @response)
      amazon_response.response
    end
  end

  def condition_response
    construct_response :condition_response
  end

  def everybody_hurts_response
    construct_response :everybody_hurts_response
  end
end

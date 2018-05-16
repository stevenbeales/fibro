# frozen_string_literal: true

require_relative 'amazon_response'

# Class to define custom responses to Alexa intent request
class AlexaResponse
  def initialize(user, response)
    @user = user
    @response = response
  end

  def response(echo_request)
    case echo_request.intent_name
    when 'ConditionIntent'
      condition_response
    when 'EverybodyHurtsIntent'
      everybody_hurts_response
    when 'ReadAllIntent'
      read_all_response
    when 'ReadEntryIntent'
      read_entry_response
    when 'ReadLastIntent'
      read_last_response
    when 'SymptomInfoIntent'
      symptom_info_response
    when 'SymptomIntent'
      symptom_response
    else
      amazon_response = AmazonResponse.new(echo_request, @response)
      amazon_response.response
    end
  end

  def condition_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :condition_response
    @response
  end

  def everybody_hurts_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :everybody_hurts_response
    @response
  end

  def read_all_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :read_all_response
    @response
  end

  def read_entry_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :read_entry_response
    @response
  end

  def read_last_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :read_last_response
    @response
  end

  def symptom_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :symptom_response
    @response
  end

  def symptom_info_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :symptom_info_response
    @response
  end
end

# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  attr_reader :user, :response

  def initialize(user, response)
    @user = user
    @response = response
  end

  def cancel_response
    response.end_session = false
    response.session_attributes = {}
    response.spoken_response = I18n.t :cancel_response
    response
  end

  def end_session_response
    response.end_session = true
    response
  end

  def help_response
    response.end_session = false
    response.spoken_response = I18n.t :help_response
    response
  end

  def launch_response
    response.end_session = false
    response.spoken_response = I18n.t :launch_response
    response
  end

  def start_over_response
    response.end_session = false
    response.session_attributes = {}
    response.spoken_response = I18n.t :start_over_response
    response
  end

  def stop_response
    response.end_session = true
    response.spoken_response = I18n.t :stop_response
    response
  end
end

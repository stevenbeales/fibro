# frozen_string_literal: true

# Class to define custom responses to Alexa Amazon built-in intent request
class AmazonResponse
  def initialize(echo_request, response)
    @echo_request = echo_request
    @response = response
  end

  def end_session_response
    @response.end_session = true
    @response
  end

  def response
    return launch_response if @echo_request.launch_request?
    return end_session_response if @echo_request.session_ended_request?

    case @echo_request.intent_name
    when 'AMAZON.NextIntent'
      next_response
    when 'AMAZON.NoIntent'
      no_response
    when 'AMAZON.PauseIntent'
      pause_response
    when 'AMAZON.PreviousIntent'
      previous_response
    when 'AMAZON.RepeatIntent'
      repeat_response
    when 'AMAZON.ResumeIntent'
      resume_response
    when 'AMAZON.YesIntent'
      yes_response
    when 'AMAZON.StopIntent'
      stop_response
    when 'AMAZON.CancelIntent'
      cancel_response
    when 'AMAZON.HelpIntent'
      help_response
    when 'AMAZON.StartOverIntent'
      start_over_response
    else
      help_response
    end
  end

  def launch_response
    @response.end_session = false
    @response.spoken_response = I18n.t :launch_response
    @response
  end

  def cancel_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :cancel_response
    @response
  end

  def help_response
    @response.end_session = false
    @response.spoken_response = I18n.t :help_response
    @response
  end

  def next_response
    @response.end_session = false
    @response.spoken_response = I18n.t :next_response
    @response
  end

  def no_response
    @response.end_session = false
    @response.spoken_response = I18n.t :no_response
    @response
  end

  def pause_response
    @response.end_session = false
    @response.spoken_response = I18n.t :pause_response
    @response
  end

  def previous_response
    @response.end_session = false
    @response.spoken_response = I18n.t :previous_response
    @response
  end

  def repeat_response
    @response.end_session = false
    @response.spoken_response = I18n.t :repeat_response
    @response
  end

  def resume_response
    @response.end_session = false
    @response.spoken_response = I18n.t :resume_response
    @response
  end

  def start_over_response
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t :start_over_response
    @response
  end

  def stop_response
    @response.end_session = true
    @response.spoken_response = I18n.t :stop_response
    @response
  end

  def yes_response
    @response.end_session = false
    @response.spoken_response = I18n.t :yes_response
    @response
  end
end

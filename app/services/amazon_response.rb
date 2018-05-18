# frozen_string_literal: true

# Class to define custom responses to Alexa Amazon built-in intent request
class AmazonResponse < BaseResponse
  def response
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
    when 'AMAZON.StartOverIntent'
      start_over_response
    else
      # Either helpintent was sent explicitly or Alexa did not understand intent
      help_response
    end
  end

  def cancel_response
    construct_start_over_response :cancel_response
  end

  def next_response
    construct_response :next_response
  end

  def no_response
    construct_response :no_response
  end

  def pause_response
    construct_response :pause_response
  end

  def previous_response
    construct_response :previous_response
  end

  def repeat_response
    construct_response :repeat_response
  end

  def resume_response
    construct_response :resume_response
  end

  def start_over_response
    construct_start_over_response :start_over_response
  end

  def stop_response
    @response.end_session = true
    @response.spoken_response = I18n.t :stop_response
    @response
  end

  def yes_response
    construct_response :yes_response
  end
end

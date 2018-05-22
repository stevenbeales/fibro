# frozen_string_literal: true

# Class to define custom responses to Alexa Amazon built-in intent request
class AmazonResponse < BaseResponse
  def response
    case echo_request.intent_name
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
end

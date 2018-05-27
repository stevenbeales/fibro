# frozen_string_literal: true

# add snakecase methods to string
using StringRefinements

# Class to define custom responses to Alexa Amazon built-in intent request
class AmazonResponse < BaseResponse
  # Response to Echo request
  def response
    intent_to_response(echo_request.intent_name)
  end

  protected

  # Fires the correct response method for an Alexa built-in intent
  #
  # == Examples
  #
  #   intent_to_response('AMAZON.CancelIntent') # => cancel_response
  #   intent_to_response('FAKE_Intent') # => help_response (using method_missing)
  def intent_to_response(intent)
    # Extract text in-between AMAZON. and Intent  
    # append _response  
    # turn into snakecase  
    # fire method  
    public_send(intent
                .gsub('AMAZON.', '')
                .gsub('Intent', '')
                .concat('_response')
                .snake_case)

    #  case echo_request.intent_name  
    #    when 'AMAZON.CancelIntent'  
    #      cancel_response  
    #    when 'AMAZON.FallbackIntent'
    #      fallback_response
    #    when 'AMAZON.NextIntent'  
    #      next_response  
    #    when 'AMAZON.NoIntent'  
    #      no_response  
    #    when 'AMAZON.PauseIntent'  
    #      pause_response  
    #    when 'AMAZON.PreviousIntent'  
    #      previous_response  
    #    when 'AMAZON.RepeatIntent'  
    #      repeat_response  
    #    when 'AMAZON.ResumeIntent'  
    #      resume_response  
    #    when 'AMAZON.StartOverIntent'  
    #      start_over_response  
    #    when 'AMAZON.StopIntent'  
    #      stop_response  
    #    when 'AMAZON.YesIntent'  
    #      yes_response  
    #    else  
    #      Either helpintent was sent explicitly or Alexa did not understand intent  
    #      help_response  
    #  end  
  end
end

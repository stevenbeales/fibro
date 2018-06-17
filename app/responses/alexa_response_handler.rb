# frozen_string_literal: true

using RequestRefinements

# Class to define custom responses to Alexa intent request
class AlexaResponseHandler
  include ResponseHelpers
  include Concord.new(:user, :echo_request, :echo_response) 

  # Return custom response to Echo request
  #  
  # If we can't respond immediately with a built-in response, use a factory to construct response to match request
  def response
    return launch_response if @echo_request.launch_request?
    return end_session_response if @echo_request.session_ended_request?

    ResponseFactory.new(@echo_request, @echo_response).response
    # SessionFactory.new(@echo_request, @echo_response).response
  end
end

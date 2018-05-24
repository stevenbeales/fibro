# frozen_string_literal: true

# Class to define custom responses to Alexa intent request
class AlexaResponseHandler
  include ResponseHelpers
  def initialize(user, echo_request, echo_response)
    @user = user
    @echo_request = echo_request
    @echo_response = echo_response
  end

  # return response to Echo request
  # if we can't respond immediately, use a factory to match response to request
  def response
    return launch_response if @echo_request.launch_request?
    return end_session_response if @echo_request.session_ended_request?

    ResponseFactory.new(@echo_request, @echo_response).response
  end
end

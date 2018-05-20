# frozen_string_literal: true

# Class to define custom responses to Alexa intent request
class AlexaResponseHandler
  include ResponseHelpers
  def initialize(user, echo_request, response)
    @user = user
    @echo_request = echo_request
    @response = response
  end

  def response
    return launch_response if @echo_request.launch_request?
    return end_session_response if @echo_request.session_ended_request?

    response_factory = ResponseFactory.new(@echo_request, @response)
    response_factory.response
  end
end

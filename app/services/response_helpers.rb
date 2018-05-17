# frozen_string_literal: true

# Common methods to construct Alexa responses
module ResponseHelpers
  def construct_response(spoken_text)
    @response.end_session = false
    @response.spoken_response = I18n.t spoken_text
    @response
  end

  def construct_start_over_response(spoken_text)
    @response.end_session = false
    @response.session_attributes = {}
    @response.spoken_response = I18n.t spoken_text
    @response
  end

  def help_response
    construct_response :help_response
  end
end

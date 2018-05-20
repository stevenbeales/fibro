# frozen_string_literal: true

# Common methods to construct Alexa responses
module ResponseHelpers
  def construct_response(spoken_text)
    @echo_response.end_session = false
    @echo_response.spoken_response = I18n.t spoken_text
    @echo_response
  end

  def construct_start_over_response(spoken_text)
    @echo_response.end_session = false
    @echo_response.session_attributes = {}
    @echo_response.spoken_response = I18n.t spoken_text
    @echo_response
  end

  def end_session_response
    @echo_response.end_session = true
    @echo_response
  end

  def condition_response
    construct_response :condition_response
  end

  def everybody_hurts_response
    construct_response :everybody_hurts_response
  end

  def help_response
    construct_response :help_response
  end

  def launch_response
    construct_response :launch_response
  end
end

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

  def cancel_response
    construct_start_over_response :cancel_response
  end

  def end_session_response
    @echo_response.end_session = true
    @echo_response
  end
 
  def fallback_response
    construct_response :fallback_response
  end

  def help_response
    construct_response :help_response
  end

  def launch_response
    construct_response :launch_response
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
    @echo_response.end_session = true
    @echo_response.spoken_response = I18n.t :stop_response
    @echo_response
  end

  def yes_response
    construct_response :yes_response
  end
end

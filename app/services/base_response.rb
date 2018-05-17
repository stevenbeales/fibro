# frozen_string_literal: true

require_relative 'response_helpers'

# Abstract base class to define custom responses to Alexa intent requests
class BaseResponse
  include ResponseHelpers

  def initialize(echo_request, response)
    @echo_request = echo_request
    @response = response
  end

  # Must be overridden in sub classes
  def response
    raise NotImplementedError
  end
end

# frozen_string_literal: true

# add snakecase methods to string
using StringRefinements

# Abstract base class to define custom responses to Alexa intent requests
class BaseResponse
  include ResponseHelpers
  include Concord.new(:echo_request, :echo_response) 
  delegate :session_attributes, to: :echo_response 
  delegate :add_attribute, to: :echo_response

  # Respond true if it is a response method call
  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.include?('response') || super
  end

  # If we try to fire a response_method but don't find one, fire help_response
  def method_missing(method_name, *arguments, &block)
    if method_name.to_s.include?('response')
      help_response
    else
      super
    end
  end

  # Must be overridden in sub classes
  def response
    raise NotImplementedError
  end

  protected

  def intent_to_response(intent)
    # Extract text before Intent  
    # append _response  
    # turn into snakecase  
    # fire method  
    public_send(intent
                .gsub('Intent', '')
                .concat('_response')
                .downcase
                .snake_case)
  end
end

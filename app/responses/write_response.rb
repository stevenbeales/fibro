# frozen_string_literal: true

# Class to define custom read responses to Alexa intent requests
class WriteResponse < BaseResponse
  def response
    case echo_request.intent_name
    when 'DeleteEntryIntent'
      delete_entry_response
    when 'NextEntryIntent'
      next_entry_response
    else
      help_response
    end
  end

  private

  def delete_entry_response
    construct_response :delete_entry_response
  end

  def next_entry_response
    construct_response :next_entry_response
  end
end

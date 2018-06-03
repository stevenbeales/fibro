# frozen_string_literal: true

# Class to define custom read responses to Alexa intent requests
class ReadResponse < BaseResponse
  def response
    case echo_request.intent_name
    when 'ReadAllIntent'
      read_all_response
    when 'ReadEntryIntent'
      read_entry_response
    when 'ReadLastIntent'
      read_last_response
    else
      help_response
    end
  end

  private

  def read_all_response
    construct_response :read_all_response
  end

  def read_entry_response
    construct_response :read_entry_response
  end

  def read_last_response
    construct_response :read_last_response
  end
end

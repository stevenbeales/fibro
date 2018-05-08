# frozen_string_literal: true

# This module contains all application constants
module AppConstants
  APP_NAME = 'Fibro Friend'
  CLOSING_TAG = "</speak>"
  ERROR_LOG_FILE = '/log/error.log'
  LOG_FILE = '/log/fibro.log'
  MAX_RESPONSE_LEN = 8000 # Give extra characters for conversion to json
  OPENING_TAG = "<speak>"
  PADDING_LEN = 25 # for the type: "SSML" and ssml: parts
end

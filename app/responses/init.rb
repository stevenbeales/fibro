# frozen_string_literal: true

require 'active_support/core_ext/module/delegation'
require './lib/refinements/string_refinements'
require 'concord'
require_relative 'response_helpers'

# BaseResponse must be required before its child classes
require_relative 'base_response'

require_relative 'response_factory'
require_relative 'alexa_response_handler'
require_relative 'amazon_response'

require_relative 'condition_response'
require_relative 'read_response'
require_relative 'write_response'
require_relative 'symptom_response'

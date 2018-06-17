# frozen_string_literal: true

require 'alexa_web_service'

# Add methods to AlexaWebService::Request class 
module RequestRefinements
  refine AlexaWebService::Request do
    def previous_intent
      attributes[:previous_intent] || ''
    end

    def symptom_name
      attributes[:symptom_name] || ''
    end
  end
end

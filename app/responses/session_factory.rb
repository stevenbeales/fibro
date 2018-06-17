# frozen_string_literal: true

using RequestRefinements

# Factory class that returns the correct Response Class for a Alexa request if session.attributes[previous_intent] 
# is not null
class SessionFactory
  include ResponseHelpers
  include Concord.new(:echo_request, :echo_response) 
  
  def response
    case @echo_request.previous_intent.size.positive? && @echo_request.symptom_name.size.positive?
    when @echo_request.previous_intent == 'SymptomIntent'
      store_symptom_rating(@echo_request.symptom_name)
    else
      help_with_rating_response
    end
  end

  protected 

  def store_symptom_rating(symptom)
    symptom
  end
end

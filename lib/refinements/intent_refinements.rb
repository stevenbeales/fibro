# frozen_string_literal: true

require 'alexa_generator'

# Add methods to AlexaGenerator::Intent class 
module IntentRefinements
  refine AlexaGenerator::Intent do
    attr_reader :samples
    
    def add_samples_from(intents_and_samples)
      @samples = remove_intents(intents_and_samples)
      self
    end
    
    def custom_types_for
      slots.map { |slot| { value: slot.name, synonyms: slot.bindings.flatten } }
    end

    private

    # Transforms [intent] [sample] to [sample]
    def remove_intent(sample)
      sample.gsub(name.to_s + ' ', '')
    end

    def remove_intents(intents_and_samples)
      intents_and_samples.map { |intent_sample| remove_intent(intent_sample) }
    end
  end
end

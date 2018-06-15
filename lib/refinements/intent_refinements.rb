# frozen_string_literal: true

require 'alexa_generator'

# Add methods to AlexaGenerator::Intent class 
module IntentRefinements
  refine AlexaGenerator::Intent do
    attr_reader :samples
    
    # Store samples with intents
    # Takes a list of sample utterances in Alexa 1.0 sample utterance format ([intent] [sample])
    def add_samples_from(intents_and_samples)
      @samples = remove_intents(intents_and_samples)
      self
    end
    
    # Returns an array of custom types in Alexa 2.0 format
    def custom_types_for
      slots.select { |slot| slot.bindings.size.positive? }
           .map { |slot| { value: slot.name, synonyms: slot.bindings.flatten } }
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

# frozen_string_literal: true

require 'alexa_generator'

# Add methods to AlexaGenerator::Intent class 
module IntentRefinements
  refine AlexaGenerator::Intent do
    attr_reader :samples

    def add_samples(samples, index)
      @samples = remove_intents_from_samples(samples, index)
      self
    end

    private

    # Transforms [intent] [sample] to [sample]
    def remove_intent(sample)
      sample.gsub(name.to_s + ' ', '')
    end

    def remove_intents_from_samples(samples, index)
      samples_only = []
      samples[index].each do |sample|
        samples_only.concat([remove_intent(sample)])
      end
      samples_only
    end
  end
end

# frozen_string_literal: true

unless defined? INTERACTION_MODEL_GENERATOR_LOADED 
  INTERACTION_MODEL_GENERATOR_LOADED = 1

  require_relative 'init'
  require './app/app_constants'
  require './lib/refinements/intent_refinements'
  
  using IntentRefinements

  # Class to regenerate the interaction model and sample utterances speech assets for Alexa if in test environment  
  # Entry point to regeneration of the interactionModel.json and sampleUtterances.txt files
  class SpeechAssetGenerator
    def self.generate(interaction_file:, utterances_file:)
      # Build an in memory JSON Interaction Model in Alexa 1.0 format
      interim_model = InterimModelBuilder.new(AlexaGenerator::InteractionModel,
                                              IntentBuilders::CUSTOM_INTENTS,
                                              IntentBuilders::AMAZON_INTENTS).model
      # Create the sample utterances file in Alexa 1.0 format
      utterances = UtterancesModel.new(interim_model)
      utterances.save(interaction_file)
  
      # Create the interaction model in Alexa 2.0 format
      combiner = JsonInteractionModel.new(utterances, interim_model)
      combiner.save(utterances_file)
    end
  end

  if test?
    SpeechAssetGenerator.generate(interaction_file: "./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt", 
                                  utterances_file: "./#{AppConstants::SPEECH_FOLDER}/interactionModel.json")
  end
end

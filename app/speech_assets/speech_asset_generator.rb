# frozen_string_literal: true

unless defined? INTERACTION_MODEL_GENERATOR_LOADED 
  INTERACTION_MODEL_GENERATOR_LOADED = 1

  require_relative 'init'
  
  # Class to regenerate the interaction model and sample utterances speech assets for Alexa if in test environment  
  # Entry point to regeneration of the interactionModel.json and sampleUtterances.txt files
  class SpeechAssetGenerator
    def self.generate(interaction_file, utterances_file)
      # Build an in memory JSON Interaction Model in Alexa 1.0 format
      interim_model_builder = InterimModelBuilder.new(AlexaGenerator::InteractionModel,
                                                      IntentBuilders::CUSTOM_INTENTS,
                                                      IntentBuilders::AMAZON_INTENTS)
      # Create the sample utterances file in Alexa 1.0 format
      utterance_model = UtterancesModel.new(interim_model_builder.model)
      utterance_model.save(utterances_file)
  
      # Create the interaction json file in Alexa 2.0 format
      combiner = InteractionModel.new(interim_model_builder, utterance_model)
      combiner.save(interaction_file)
    end
  end

  unless production? 
    SpeechAssetGenerator.generate("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json",
                                  "./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt")
  end
end

# frozen_string_literal: true

unless defined? INTERACTION_MODEL_GENERATOR_LOADED 
  INTERACTION_MODEL_GENERATOR_LOADED = 1

  require_relative 'init'
  require './app/app_constants'
  require './lib/refinements/intent_refinements'

  using IntentRefinements

  if test?

    # Regenerate the interaction model and sample utterances speech assets for Alexa if in test environment  
    # Entry point to regeneration of the interactionModel.json and sampleUtterances.txt files
      
    # Build an in memory JSON Interaction Model in Alexa 1.0 format
    interaction_model = InteractionModelBuilder.new(AlexaGenerator::InteractionModel,
                                                    IntentBuilders::CUSTOM_INTENTS,
                                                    IntentBuilders::AMAZON_INTENTS).model
    # Create the sample utterances file in Alexa 1.0 format
    utterances = UtterancesModel.new(interaction_model)
    utterances.save("./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt")
 
    # Create the interaction model in Alexa 2.0 format
    combiner = JsonInteractionModel.new(utterances, interaction_model)
    combiner.save("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json")
  end
end

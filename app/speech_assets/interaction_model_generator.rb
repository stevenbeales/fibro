# frozen_string_literal: true

unless defined? INTERACTION_MODEL_GENERATOR_LOADED 
  INTERACTION_MODEL_GENERATOR_LOADED = 1

  require_relative 'init'
  require './app/app_constants'
  require 'pp'
  require './lib/refinements/intent_refinements'

  using IntentRefinements

  if test?

    # Regenerate the interaction model and sample utterances speech assets for Alexa if in test environment  
    # Entry point to regeneration of the interactionModel.json and sampleUtterances.txt files
      
    # Build an in memory JSON Interaction Model in Alexa 1.0 format
    interaction_model = InteractionModelBuilder.new(builder_class: AlexaGenerator::InteractionModel,
                                                    custom_intents: Intents::CUSTOM_INTENTS,
                                                    amazon_intents: Intents::AMAZON_INTENTS).model

    # Convert the model into Alexa 2.0 format and save to interactionModel.json
    json_schema = JsonBaseModel.new(model: interaction_model)
    
    # Create the sample utterances file in Alexa 1.0 format
    utterances = UtterancesModel.new(model: interaction_model)
    utterances.save("./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt")

    combiner = JsonInteractionModel.new(utterance_model: utterances.model, interaction_model: json_schema)
    combiner.save("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json")
  end
end

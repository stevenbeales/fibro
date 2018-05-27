# frozen_string_literal: true

require_relative 'init'
require './app/app_constants'

# Regenerate the interaction model and sample utterances speech assets for Alexa if in test environment  
# Entry point to regeneration of the interactionModel.json and sampleUtterances.txt files
if test?
  custom_intents = { ConditionIntent: ConditionIntentBuilder,
                     EverybodyHurtsIntent: EverybodyHurtsIntentBuilder,
                     ReadAllIntent: ReadAllIntentBuilder,
                     ReadEntryIntent: ReadEntryIntentBuilder,
                     ReadLastIntent: ReadLastIntentBuilder,
                     SymptomIntent: SymptomIntentBuilder,
                     SymptomInfoIntent: SymptomInfoIntentBuilder }

  amazon_intents = { Cancel: CancelIntentBuilder,
                     Fallback: FallbackIntentBuilder,
                     Help: HelpIntentBuilder,
                     Next: NextIntentBuilder,
                     No: NoIntentBuilder,
                     Pause: PauseIntentBuilder,
                     Previous: PreviousIntentBuilder,
                     Repeat: RepeatIntentBuilder,
                     Resume: ResumeIntentBuilder,
                     StartOver: StartOverIntentBuilder,
                     Stop: StopIntentBuilder,
                     Yes: YesIntentBuilder }

  interaction_model = InteractionModelBuilder.new(builder_class: AlexaGenerator::InteractionModel,
                                                  custom_intents: custom_intents,
                                                  amazon_intents: amazon_intents).model

  json_schema = JsonInteractionModel.new(interaction_model, AppConstants::INVOCATION_NAME)
  json_schema.save("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json")

  utterances = UtterancesModel.new(interaction_model)
  utterances.save("./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt")
end

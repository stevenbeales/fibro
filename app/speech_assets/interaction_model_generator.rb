# frozen_string_literal: true

require_relative 'init'
require './app/app_constants'

# regenerate the interaction model and sample utterances speech assets for Alexa if in test environment
if test?
  custom_intents = { ConditionIntent: ConditionIntentBuilder,
                     EverybodyHurtsIntent: EverybodyHurtsIntentBuilder,
                     ReadAllIntent: ReadAllIntentBuilder,
                     ReadEntryIntent: ReadEntryIntentBuilder,
                     ReadLastIntent: ReadLastIntentBuilder,
                     SymptomIntent: SymptomIntentBuilder,
                     SymptomInfoIntent: SymptomInfoIntentBuilder }

  amazon_intents = { Cancel: CancelIntentBuilder,
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

  model = AlexaGenerator::InteractionModel.build do |modl|
    custom_intents.each do |key, value|
      modl.add_intent(key) do |intent|
        value.new(intent).add
      end
    end
    amazon_intents.each do |key, value|
      modl.add_intent(%(AMAZON.#{key}Intent)) do |intent|
        value.new(intent).add
      end
    end
  end

  json_schema = JsonInteractionModel.new(model)
  json_schema.save("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json")

  utterances = UtterancesModel.new(model)
  utterances.save("./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt")
end

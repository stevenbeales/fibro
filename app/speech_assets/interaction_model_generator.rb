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

  interaction_model_file = File.open("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json", 'w+')
  json_schema = JsonInteractionModel.new(model)
  interaction_model_file.puts json_schema.schema
  interaction_model_file.close
  utterances_file = File.open("./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt", 'w+')
  utterances = UtterancesModel.new(model)
  utterances.describe { |a| utterances_file.puts a }
  utterances_file.close
end

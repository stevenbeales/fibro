# frozen_string_literal: true

require_relative 'init'
require_relative 'json_interaction_model'
require_relative 'utterances_model'
require './app/app_constants'

model = AlexaGenerator::InteractionModel.build do |modl|
  modl.add_intent(:ConditionIntent) do |intent|
    ConditionIntentBuilder.new(intent).add
  end
  modl.add_intent(:EverybodyHurtsIntent) do |intent|
    EverybodyHurtsIntentBuilder.new(intent).add
  end
  modl.add_intent(:ReadAllIntent) do |intent|
    ReadAllIntentBuilder.new(intent).add
  end
  modl.add_intent(:ReadEntryIntent) do |intent|
    ReadEntryIntentBuilder.new(intent).add
  end
  modl.add_intent(:ReadLastIntent) do |intent|
    ReadLastIntentBuilder.new(intent).add
  end
  modl.add_intent(:SymptomIntent) do |intent|
    SymptomIntentBuilder.new(intent).add
  end
  modl.add_intent(:SymptomInfoIntent) do |intent|
    SymptomInfoIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::HELP) do |intent|
    HelpIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::NEXT) do |intent|
    NextIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::NO) do |intent|
    NoIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::PAUSE) do |intent|
    PauseIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::PREVIOUS) do |intent|
    PreviousIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::REPEAT) do |intent|
    RepeatIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::RESUME) do |intent|
    ResumeIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::START_OVER) do |intent|
    StartOverIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::YES) do |intent|
    YesIntentBuilder.new(intent).add
  end
end

if test?
  interaction_model_file = File.open("./#{AppConstants::SPEECH_FOLDER}/interactionModel.json", 'w+')
  json_schema = JsonInteractionModel.new(model)
  interaction_model_file.puts json_schema.schema
  interaction_model_file.close
  utterances_file = File.open("./#{AppConstants::SPEECH_FOLDER}/SampleUtterances.txt", 'w+')
  utterances = UtterancesModel.new(model)
  utterances.describe { |a| utterances_file.puts a }
  utterances_file.close
end

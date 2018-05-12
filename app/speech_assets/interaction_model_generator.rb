# frozen_string_literal: true

require_relative 'init'
require_relative 'json_interaction_model'
require_relative 'utterances_model'

model = AlexaGenerator::InteractionModel.build do |modl|
  modl.add_intent(:ConditionIntent) do |intent|
    ConditionIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::HELP) do |intent|
    HelpIntentBuilder.new(intent).add
  end
  modl.add_intent(AlexaGenerator::Intent::AmazonIntentType::START_OVER) do |intent|
    StartOverIntentBuilder.new(intent).add
  end
  modl.add_intent(:EverybodyHurtsIntent) do |intent|
    EverybodyHurtsIntentBuilder.new(intent).add
  end
  modl.add_intent(:SymptomIntent) do |intent|
    SymptomIntentBuilder.new(intent).add
  end
  modl.add_intent(:SymptomInfoIntent) do |intent|
    SymptomInfoIntentBuilder.new(intent).add
  end
end

if test?
  json_schema = JsonInteractionModel.new(model)
  puts json_schema.schema
  puts
  puts 'Utterances'
  utterances = UtterancesModel.new(model)
  utterances.describe { |a| puts a }
end

# frozen_string_literal: true

RSpec.describe UtterancesModel do
  subject { UtterancesModel.new(model) }
  let(:model) do
    AlexaGenerator::InteractionModel.build do |modl|
      modl.add_intent(:FibromyalgiaInformationIntent) do |intent|
        intent.add_slot(:Condition, :LIST_OF_CONDITIONS) do |slot|
          slot.add_bindings('Fibromyalgia', 'Fibro')
        end
        intent.add_utterance_template('{Condition}')
      end
    end
  end

  it 'can describe custom slots' do
    expect { |utterance| subject.describe(&utterance) }.to yield_control
  end
end

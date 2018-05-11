# frozen_string_literal: true

RSpec.describe IntentBuilder do
  subject { IntentBuilder.new(model) }
  let(:model) do
    AlexaGenerator::InteractionModel.build do |modl|
      modl.add_intent(:FibromyalgiaInformationIntent)
    end
  end
  let(:intent) { model.intents.first }

  it 'is an abstract class' do
    expect { subject.add }.to raise_error NotImplementedError
  end
end

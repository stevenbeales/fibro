# frozen_string_literal: true

RSpec.describe EverybodyHurtsIntentBuilder do
  subject { EverybodyHurtsIntentBuilder.new(model) }
  let(:model) do
    AlexaGenerator::InteractionModel.build do |modl|
      modl.add_intent(:FibromyalgiaInformationIntent)
    end
  end
  let(:intent) { model.intents.first }

  it 'is not an abstract class' do
    expect { subject.add }.not_to raise_error NotImplementedError
  end
end
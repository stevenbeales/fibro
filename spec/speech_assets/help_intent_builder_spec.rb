# frozen_string_literal: true

RSpec.describe HelpIntentBuilder do
  subject { HelpIntentBuilder.new(model) }
  let(:model) do
    AlexaGenerator::InteractionModel.build { |modl| modl.add_intent(:AHelpIntent) }
  end

  it 'is not an abstract class' do
    expect { subject.add }.not_to raise_error NotImplementedError
  end
end

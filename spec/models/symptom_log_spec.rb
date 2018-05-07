# frozen_string_literal: true

RSpec.describe SymptomLog, type: :model do
  subject { FactoryBot.build(:test_symptom_log) }

  include_examples 'valid object creation', described_class

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[user]
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      an_object = described_class.new
      expect(an_object.id).to be_nil
    end

    it 'can be persisted' do
      symptom_log = build(:timmy_log)
      expect { symptom_log.save! }.not_to raise_error
    end

    it 'has unique user' do
      expect { described_class.create(user: User.authenticate(TestConstants::TEST_SYMPTOM_USER)) }
        .to change { described_class.count }.by(0)
    end
  end

  describe '#to_s' do
    it "prints user's symptom log" do
      symptom_log = build(:timmy_log)
      expect(symptom_log.to_s).to eq("Timmy's symptom log")
    end
  end

  describe '#discard' do
    an_object = described_class.find_or_create_by! user: User.authenticate(TestConstants::TEST_SYMPTOM_USER)
    include_examples 'discards', an_object
  end
end

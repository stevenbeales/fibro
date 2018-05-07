# frozen_string_literal: true

RSpec.describe Symptom, type: :model do
  subject { FactoryBot.create(:test_symptom) }

  include_examples 'valid object creation', described_class

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[name description]
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  include_examples 'required attribute', :name, 2

  include_examples 'default attribute', :description, ''

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_SYMPTOM

  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      an_object = described_class.new
      expect(an_object.id).to be_nil
    end

    it 'can be persisted' do
      symptom = build(:headache)
      symptom.save!

      persisted_symptom = described_class.find_by(name: 'Headache')
      expect(persisted_symptom.id).not_to be_nil
      expect(persisted_symptom.name).to eq 'Headache'
    end

    it 'has unique name' do
      expect { described_class.create(name: 'Headache') }.to change { described_class.count }.by(0)
    end
  end

  describe '#to_s' do
    it 'prints name' do
      symptom = build(:headache)
      expect(symptom.to_s).to eq(symptom.name)
    end
  end

  describe '#discard' do
    an_object = described_class.find_or_create_by! name: 'described_class 3'
    include_examples 'discards', an_object
  end
end

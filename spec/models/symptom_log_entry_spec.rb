# frozen_string_literal: true

RSpec.describe SymptomLogEntry, type: :model do
  subject { FactoryBot.create(:test_symptom_log_entry) }

  include_examples 'valid object creation', described_class

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[symptom_log score severity entry_date]
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  include_examples 'required attribute', :entry_date, 2
  include_examples 'required attribute', :severity, 2
  include_examples 'required attribute', :score, 2

  include_examples 'default attribute', :entry_date, Time.now
  include_examples 'default attribute', :score, 5
  include_examples 'default attribute', :severity, 'Moderate'

  include_examples 'invalid create', 'invalid create without required fields'

  describe '#number' do
    include_context 'restore attributes'
    include_examples 'number specs', 'score'
  end

  describe 'duration' do
    it 'supports time interval in hours' do
      subject.duration = '2 hours'
      subject.save!
    end

    it 'supports time interval in days' do
      subject.duration = '2 days'
      subject.save!
    end

    it 'supports time interval in minutes' do
      subject.duration = '2 minutes'
      subject.save!
    end
    
    it 'supports time interval in months' do
      subject.duration = '5 months'
      subject.save!
    end

    it 'supports time interval in years' do
      subject.duration = '3 years'
      subject.save!
    end
  end

  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      an_object = described_class.new
      expect(an_object.id).to be_nil
    end

    it 'can be persisted' do
      an_object = build(:another_log_entry)
      an_object.save!

      persisted_object = described_class.find_by(symptom_log: build(:test_symptom_log), symptom: build(:test_symptom))
      expect(persisted_object.id).not_to be_nil
      expect(persisted_object.symptom.name).to eq 'TestSymptom'
    end
  end

  describe '#to_s' do
    it 'prints name' do
      an_object = build(:test_symptom_log_entry)
      expect(an_object.to_s).to eq(%(#{an_object.entry_date} #{an_object.symptom} #{an_object.score}))
    end
  end

  describe '#discard' do
    let(:item) do
      described_class.find_or_create_by!(symptom_log: build(:test_symptom_log), symptom: build(:test_symptom))
    end

    before :each do
      item.discard
    end

    context 'does not delete' do
      it { expect(item.discarded?).to eq true }

      it { expect(item.class.kept.include?(item)).to be_falsey }
    end
  end
end

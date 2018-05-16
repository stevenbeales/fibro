# frozen_string_literal: true

RSpec.describe AlexaResponse do
  subject { described_class.new(user, AlexaWebService::Response.new) }
  let!(:user) { build(:test_user) }

  it { expect(subject).to be_an AlexaResponse }

  describe '.condition_response' do
    it do
      expect(subject.condition_response.spoken_response).to eq(I18n.t(:condition_response))
    end
  end

  describe '.everybody_hurts_response' do
    it do
      expect(subject.everybody_hurts_response.spoken_response).to eq(I18n.t(:everybody_hurts_response))
    end
  end

  describe '.read_all_response' do
    it do
      expect(subject.read_all_response.spoken_response).to eq I18n.t(:read_all_response)
    end
  end

  describe '.read_entry_response' do
    it do
      expect(subject.read_entry_response.spoken_response).to eq I18n.t(:read_entry_response)
    end
  end

  describe '.read_last_response' do
    it do
      expect(subject.read_last_response.spoken_response).to eq I18n.t(:read_last_response)
    end
  end

  describe '.symptom_response' do
    it do
      expect(subject.symptom_response.spoken_response).to eq(I18n.t(:symptom_response))
    end
  end

  describe '.symptom_info_response' do
    it do
      expect(subject.symptom_info_response.spoken_response).to eq(I18n.t(:symptom_info_response))
    end
  end
end

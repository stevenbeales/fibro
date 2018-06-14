# frozen_string_literal: true

RSpec.describe AlexaResponseHandler do
  subject { described_class.new(user, echo_request, AlexaWebService::Response.new) }
  let(:user) { build(:test_user) }
  let(:echo_request) { double.as_null_object }

  it { expect(subject).to be_an AlexaResponseHandler }

  describe 'responses' do
    before(:each) do
      allow(echo_request).to receive(:launch_request?).and_return(false)
      allow(echo_request).to receive(:session_ended_request?).and_return(false)
    end

    describe '.condition_response' do
      it do
        allow(echo_request).to receive(:intent_name).and_return('ConditionIntent')
        expect(subject.response.spoken_response).to eq(I18n.t(:condition_response))
      end
    end
    
    describe '.read_all_response' do
      it do
        allow(echo_request).to receive(:intent_name).and_return('ReadAllIntent')
        expect(subject.response.spoken_response).to eq I18n.t(:read_all_response)
      end
    end

    describe '.read_entry_response' do
      it do
        allow(echo_request).to receive(:intent_name).and_return('ReadEntryIntent')
        expect(subject.response.spoken_response).to eq I18n.t(:read_entry_response)
      end
    end

    describe '.read_last_response' do
      it do
        allow(echo_request).to receive(:intent_name).and_return('ReadLastIntent')
        expect(subject.response.spoken_response).to eq I18n.t(:read_last_response)
      end
    end

    describe '.symptom_response' do
      it do
        allow(echo_request).to receive(:intent_name).and_return('SymptomIntent')
        allow(echo_request).to receive(:symptom).and_return('Pain')
        expect(subject.response.spoken_response).to eq(I18n.t(:symptom_response) % 'Pain')
      end
    end

    describe '.symptom_info_response' do
      it do
        allow(echo_request).to receive(:intent_name).and_return('SymptomInfoIntent')
        expect(subject.response.spoken_response).to eq(I18n.t(:symptom_info_response))
      end
    end

    describe 'fake symptom intent' do
      it 'returns help response' do
        allow(echo_request).to receive(:intent_name).and_return('SymptomFakeIntent')
        expect(subject.response.spoken_response).to eq(I18n.t(:help_response))
      end
    end

    describe 'fake read intent' do
      it 'returns help response' do
        allow(echo_request).to receive(:intent_name).and_return('ReadFakeIntent')
        expect(subject.response.spoken_response).to eq(I18n.t(:help_response))
      end
    end

    describe 'fake AMAZON intent' do
      it 'returns help response' do
        allow(echo_request).to receive(:intent_name).and_return('AMAZONFakeIntent')
        expect(subject.response.spoken_response).to eq(I18n.t(:help_response))
      end
    end

    describe 'fake intent' do
      it 'returns help response' do
        allow(echo_request).to receive(:intent_name).and_return('!@#$')
        expect(subject.response.spoken_response).to eq(I18n.t(:help_response))
      end
    end
  end
end

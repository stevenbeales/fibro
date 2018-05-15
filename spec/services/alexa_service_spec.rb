# frozen_string_literal: true

require 'alexa_web_service'

RSpec.describe AlexaService do
  subject { described_class.new(user, AlexaWebService::Response.new) }
  let!(:user) { build(:test_user) }

  it { expect(subject).to be_an AlexaService }

  describe '.cancel_response' do
    it do
      expect(subject.cancel_response.spoken_response).to eq(I18n.t(:cancel_response))
    end
  end

  describe '.condition_response' do
    it do
      expect(subject.condition_response.spoken_response).to eq(I18n.t(:condition_response))
    end
  end

  describe '.end_session_response' do
    it do
      expect(subject.end_session_response.spoken_response).to eq ''
    end
  end

  describe '.everybody_hurts_response' do
    it do
      expect(subject.everybody_hurts_response.spoken_response).to eq(I18n.t(:everybody_hurts_response))
    end
  end

  describe '.help_response' do
    it do
      expect(subject.help_response.spoken_response).to eq(I18n.t(:help_response))
    end
  end

  describe '.launch_response' do
    it do
      expect(subject.launch_response.spoken_response).to eq(I18n.t(:launch_response))
    end
  end

  describe '.next_response' do
    it do
      expect(subject.next_response.spoken_response).to eq(I18n.t(:next_response))
    end
  end

  describe '.no_response' do
    it do
      expect(subject.no_response.spoken_response).to eq(I18n.t(:no_response))
    end
  end

  describe '.pause_response' do
    it do
      expect(subject.pause_response.spoken_response).to eq(I18n.t(:pause_response))
    end
  end

  describe '.previous_response' do
    it do
      expect(subject.previous_response.spoken_response).to eq(I18n.t(:previous_response))
    end
  end

  describe '.repeat_response' do
    it do
      expect(subject.repeat_response.spoken_response).to eq(I18n.t(:repeat_response))
    end
  end

  describe '.resume_response' do
    it do
      expect(subject.resume_response.spoken_response).to eq(I18n.t(:resume_response))
    end
  end

  describe '.start_over_response' do
    it do
      expect(subject.start_over_response.spoken_response).to eq(I18n.t(:start_over_response))
    end
  end

  describe '.stop_response' do
    it do
      expect(subject.stop_response.spoken_response).to eq(I18n.t(:stop_response))
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

  describe '.yes_response' do
    it do
      expect(subject.yes_response.spoken_response).to eq(I18n.t(:yes_response))
    end
  end
end

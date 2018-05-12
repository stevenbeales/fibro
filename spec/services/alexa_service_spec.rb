# frozen_string_literal: true

require 'alexa_web_service'

RSpec.describe AlexaService do
  subject { described_class.new(user, AlexaWebService::Response.new) }
  let!(:user) { build(:test_user) }

  it { expect(subject).to be_an AlexaService }

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

  describe '.cancel_response' do
    it do
      expect(subject.cancel_response.spoken_response).to eq(I18n.t(:cancel_response))
    end
  end
end

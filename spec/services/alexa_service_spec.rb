# frozen_string_literal: true

RSpec.describe AlexaService do
  subject { described_class.new(user) }
  let!(:user) { build(:test_user) }

  it { expect(subject).to be_an AlexaService }

  describe '.help_response' do
    it do
      expect(AlexaService.help_response).to eq(I18n.t(:help_response))
    end
  end

  describe '.launch_response' do
    it do
      expect(AlexaService.launch_response).to eq(I18n.t(:launch_response))
    end
  end

  describe '.start_over_response' do
    it do
      expect(AlexaService.start_over_response).to eq(I18n.t(:start_over_response))
    end
  end

  describe '.goodbye_response' do
    it do
      expect(AlexaService.goodbye_response).to eq(I18n.t(:goodbye_response))
    end
  end

  describe '.cancel_response' do
    it do
      expect(AlexaService.cancel_response).to eq(I18n.t(:cancel_response))
    end
  end
end

# frozen_string_literal: true

RSpec.describe BaseResponse do
  subject { described_class.new(user, AlexaWebService::Response.new) }
  let(:user) { build(:test_user) }

  it 'raises a not implemented error' do
    expect { subject.response }.to raise_error NotImplementedError
  end

  describe '.respond_to?' do
    it do
      expect(subject.respond_to?(:fake_response)).to eq true
    end

    it do
      expect(subject.respond_to?(:fake)).to eq false
    end
  end

  describe '.method_missing' do
    it do
      expect(subject.fake_response.spoken_response).to eq(I18n.t(:help_response))
    end

    it do
      expect { subject.fake }.to raise_error(NoMethodError)
    end
  end

  describe '.add_attribute' do
    it do
      expect(subject.respond_to?(:add_attribute)).to eq true 
    end
  end

  describe '.session_attributes' do
    it do
      expect(subject.respond_to?(:session_attributes)).to eq true 
    end
  end
end

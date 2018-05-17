# frozen_string_literal: true

RSpec.describe BaseResponse do
  subject { described_class.new(user, AlexaWebService::Response.new) }
  let!(:user) { build(:test_user) }

  it 'raises a not implemented error' do
    expect { subject.response }.to raise_error NotImplementedError
  end
end

# frozen_string_literal: true

require_relative '../app'

RSpec.describe Sinatra::Application do
  subject { Sinatra::Application }

  it 'should not throw an exception when posting a request to the home page' do
    expect { post '/' }.not_to raise_error
  end
end

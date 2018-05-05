# frozen_string_literal: true

require './app'

RSpec.describe App do
  subject { App.new }

  it { expect(subject).to be_a Sinatra::Wrapper }

  it 'should not throw an exception when posting a request to the home page' do
    expect { post '/' }.not_to raise_error
  end

  it 'should not throw an exception when getting home page' do
    get '/'
    expect(last_request.path).to eq('/')
  end

  it 'should redirect to privacy policy' do
    get '/privacy'
    # http://example.org/ is rack test default URL
    expect(last_response.location).to eq 'http://example.org/privacy.html'
  end

  it 'should redirect to privacy policy' do
    get '/privacy'
    expect(last_response.redirect?).to be_truthy
  end
end

# frozen_string_literal: true

RSpec.describe Sinatra::Application do
  subject { Sinatra::Application }

  it 'should not throw an exception when posting a request to the home page' do
    expect { post '/' }.not_to raise_error
  end

  it 'should not throw an exception when getting home page' do
    get '/'
    expect(last_request.path).to eq('/')
  end

  it 'should redirect to privacy policy' do
    get '/privacy'
    expect(last_response.location).to eq 'https://example.org/privacy' # https://example.org/ is rack test default URL
  end

  it 'should contain privacy policy' do
    get '/privacy'
    expect(last_response.redirect?).to be_truthy
  end
end

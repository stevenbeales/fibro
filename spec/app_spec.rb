# frozen_string_literal: true

require './app'

RSpec.describe App do
  subject { App.new }

  it { expect(subject).to be_a Sinatra::Wrapper }

  context 'home page' do
    it 'should not throw an exception when posting a request' do
      expect { post '/' }.not_to raise_error
    end

    it 'should equal index.html' do
      get '/'
      expect(last_response.body).to eq IO.binread(subject.settings.public_folder + '/index.html')
    end

    it 'should contain fibro friend' do
      get '/'
      expect(last_response.body.downcase).to include('fibro friend')
    end
  end

  context 'privacy policy' do
    it 'should not redirect to privacy policy' do
      get '/privacy'
      expect(last_response.redirect?).to be_falsey
    end

    it 'should contain individuals in privacy policy' do
      get '/privacy'
      expect(last_response.body).to include 'individuals'
    end

    it 'should equal privacy.html' do
      get '/privacy'
      expect(last_response.body).to eq IO.binread(subject.settings.public_folder + '/privacy.html')
    end
  end

  it 'should return not found for non-existent route' do
    get '/blah'
    expect(last_response.body).to include 'Not Found'
  end
end

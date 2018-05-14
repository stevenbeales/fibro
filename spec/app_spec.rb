# frozen_string_literal: true

require './app'

RSpec.describe Sinatra::MyApp do
  subject do
    # IMPORTANT - .new returns a Sinatra::Wrapper so must use mechanism below to get a Sinatra::MyApp
    app = described_class.allocate
    app.send :initialize
    app
  end
  let(:rep) { AlexaWebService::Response.new }
  let(:echo_request) { double }
  let(:alexa_service) { AlexaService.new(nil, rep) }

  it { expect(subject).to be_a Sinatra::MyApp }

  it 'should allow helper methods to be mocked' do
    # This test shows how to test a helper method in an App in SInatra
    # Notice we must instantiate the App class in a special way
    # And call the helper method directly on an App class instance to mock it
    # We cannot stub the helper methid in a regular get or post call.

    allow(subject).to receive(:build_response).with(echo_request, rep)
    expect { subject.build_response(echo_request, rep) }.not_to raise_error
  end

  context 'start and stop intents' do
    it 'should return launch_response from launch_request' do
      allow(echo_request).to receive(:launch_request?).and_return true
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.launch_response
    end

    it 'should return end_session_response from end session request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return true
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.end_session_response
    end
  end

  context 'custom intents' do
    it 'should return condition_response from condition intent request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return false
      allow(echo_request).to receive(:intent_name).and_return "ConditionIntent"
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.condition_response
    end

    it 'should return symptom_info_response from symptom info intent request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return false
      allow(echo_request).to receive(:intent_name).and_return "SymptomInfoIntent"
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.symptom_info_response
    end

    it 'should return symptom_response from symptom intent request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return false
      allow(echo_request).to receive(:intent_name).and_return "SymptomIntent"
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.symptom_response
    end

    it 'should return everybody_hurts_response from everybody hurts intent request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return false
      allow(echo_request).to receive(:intent_name).and_return "EverybodyHurtsIntent"
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.everybody_hurts_response
    end

    it 'should return help_response misheard request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return false
      allow(echo_request).to receive(:intent_name).and_return "Blah Blah what"
      expect(subject.build_response(echo_request, rep)).to eq alexa_service.help_response
    end
  end

  context 'home page' do
    it 'should throw an exception when posting a request' do
      expect { post '/' }.to raise_error
    end

    it 'should be OK' do
      get '/'
      expect(last_response).to be_ok
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
    it 'should be OK' do
      get '/'
      expect(last_response).to be_ok
    end

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

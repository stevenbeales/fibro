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
  let(:echo_request) { double.as_null_object }
  let(:alexa_service) { AlexaResponse.new(nil, rep) }

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
      allow(echo_request).to receive(:intent_name).and_return "LaunchRequestIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t :launch_response
    end

    it 'should return end_session_response from end session request' do
      allow(echo_request).to receive(:launch_request?).and_return false
      allow(echo_request).to receive(:session_ended_request?).and_return true
      allow(echo_request).to receive(:intent_name).and_return "SessionEndedRequest"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq ''
    end
  end

  context 'custom intents' do
    before(:each) do
      allow(echo_request).to receive(:launch_request?).and_return(false)
      allow(echo_request).to receive(:session_ended_request?).and_return(false)
    end

    it 'should return condition_response from condition intent request' do
      allow(echo_request).to receive(:intent_name).and_return "ConditionIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:condition_response)
    end

    it 'should return read_all_response from read all intent request' do
      allow(echo_request).to receive(:intent_name).and_return "ReadAllIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:read_all_response)
    end

    it 'should return read_entry_response from read entry intent request' do
      allow(echo_request).to receive(:intent_name).and_return "ReadEntryIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:read_entry_response)
    end

    it 'should return read_last_response from read last intent request' do
      allow(echo_request).to receive(:intent_name).and_return "ReadLastIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:read_last_response)
    end

    it 'should return symptom_info_response from symptom info intent request' do
      allow(echo_request).to receive(:intent_name).and_return "SymptomInfoIntent"
      allow(echo_request).to receive(:symptom).and_return "Pain"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:symptom_info_response) % "Pain"
    end

    it 'should return symptom_response from symptom intent request' do
      allow(echo_request).to receive(:intent_name).and_return "SymptomIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:symptom_response)
    end

    it 'should return help_response misheard request' do
      allow(echo_request).to receive(:intent_name).and_return "Blah Blah what"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:help_response)
    end
  end

  context 'Amazon intents' do
    before(:each) do
      allow(echo_request).to receive(:launch_request?).and_return(false)
      allow(echo_request).to receive(:session_ended_request?).and_return(false)
    end

    it 'should return cancel_response from Amazon cancel intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.CancelIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:cancel_response)
    end

    it 'should return stop_response from Amazon stop intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.StopIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:stop_response)
    end

    it 'should return yes_response from Amazon yes intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.YesIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:yes_response)
    end

    it 'should return no_response from Amazon no intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.NoIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:no_response)
    end

    it 'should return next_response from Amazon next intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.NextIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:next_response)
    end

    it 'should return pause_response from Amazon pause intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.PauseIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:pause_response)
    end

    it 'should return previous_response from Amazon previous intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.PreviousIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:previous_response)
    end

    it 'should return resume_response from Amazon resume intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.ResumeIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:resume_response)
    end

    it 'should return repeat_response from Amazon repeat intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.RepeatIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:repeat_response)
    end

    it 'should return help_response from Amazon help intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.HelpIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:help_response)
    end

    it 'should return start_over_response from Amazon start over intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.StartOverIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:start_over_response)
    end

    it 'should return fallback_response from Amazon fall back intent request' do
      allow(echo_request).to receive(:intent_name).and_return "AMAZON.FallbackIntent"
      expect(subject.build_response(echo_request, rep).spoken_response).to eq I18n.t(:fallback_response)
    end
  end

  context 'home page' do
    it 'should throw an exception when posting a request' do
      allow(User).to receive(:authenticate).with(1)
      allow(::JSON).to receive(:parse).and_return({})
      allow(AlexaWebService::Request).to receive(:new).and_return(rep)
      allow(echo_request).to receive(:user_id)
      expect { post '/' }.to raise_error(NoMethodError)
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

# frozen_string_literal: true

# Class for Rating Pain
class RatePain
  @sessions = nil

  def self.get_session(request)
    @sessions ||= {}

    request_session = request['session']
    new_session = request_session['new']
    session_id = request_session['sessionId']

    if new_session
      puts "Creating a new session"
      session = RatePainSession.new(session_id)
      @sessions[session_id] = session
    else
      puts "Continuing Session"
      session = @sessions[session_id]
      puts "Found existing session #{session.inspect}"
    end
    session
  end
end

# Intents for Rating Pain
class RatePainIntents
  def self.handle_intent(session, request)
    intent_info = request['request']['intent']
    intent_name = intent_info['name']
    puts "Session: #{session.inspect}"

    if intent_name == 'RatePain'
      session.prompt_to_rate
    elsif intent_name == 'PainRating'
      score = intent_info['slots']['PainScore']['value']
      session.submit_score score
    else
      raise 'Unknown Intent'
    end
  end
end

# Session for rating pain
class RatePainSession
  def initialize(session_id)
    @session_id = session_id
    @ratings = [
      {
        prompt: "On a scale of one to ten, how would you rate your pain over the last 24 hours?"
      },
      {
        prompt: "How much has pain <break time='1ms'/> affected your sleep <break time='1ms'/> over the last 24 hours?"
      },
      {
        prompt: `How much has pain <break time='1ms'/> affected your activity level <break time='1ms'/>
                 over the last 24 hours?`
      },
      {
        prompt: "How much has pain <break time='1ms'/> affected your mood <break time='1ms'/> over the last 24 hours?"
      }
    ]
  end

  def finished?
    current_step.nil?
  end

  def current_step
    @ratings.find { |rating| rating[:answer].nil? }
  end

  def prompt_to_rate
    step = current_step
    if current_step.nil?
      puts "RATING IS OVER: #{@ratings}"
      text_to_ssml('Your ratings have been submitted. Thank you.')
    else
      text_to_ssml(step[:prompt])
    end
  end

  def submit_score(score)
    step = current_step
    step[:answer] = score
    puts "Saved Score: #{step}"
    prompt_to_rate
  end

  def text_to_ssml(text)
    %(#{OPENING_TAG}#{text}#{CLOSING_TAG})
  end
end
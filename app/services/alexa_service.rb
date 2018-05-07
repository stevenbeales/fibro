# frozen_string_literal: true

# Class to define Alexa's intent behavior
class AlexaService
  attr_reader :user

  def self.goodbye_response
    I18n.t :goodbye_response
  end

  def self.help_response
    I18n.t :help_response
  end

  def self.launch_response
    I18n.t :launch_response
  end

  def self.start_over_response
    I18n.t :start_over_response
  end

  def self.cancel_response
    I18n.t :cancel_response
  end

  def initialize(user)
    @user = user
  end
end

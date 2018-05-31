# frozen_string_literal: true

# Class to build Alexa custom intent based on built-in intent within Interim Model Builder
class AmazonIntent < CustomIntent
  def initialize(model, key, value)
    @model = model
    @key = %(AMAZON.#{key}Intent)
    @value = value
  end
end

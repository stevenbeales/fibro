# frozen_string_literal: true

# Static class that contains Alexa slot samples
class Samples
  ENTRY_SLOTS = [
    'entry', 'event'
  ].freeze

  LOG_SLOTS = [
    'log', 'journal', 'diary', 'symptom log'
  ].freeze

  READ_SLOTS = [
    'read', 'speak'
  ].freeze

  SYMPTOM_SLOTS = [
    'Fatigue', 'Pain', 'Fogginess', 'Memory', 'Poor Sleep', 'Depression', 'Mood Change',
    'Eyes', 'Light Sensitivity', 'Abdominal Pain', 'Dizzy', 'Balance Problems', 'Headache',
    'Joint Pain', 'Lymph Node Tenderness', 'Sore Throat', 'Other'
  ].freeze
end

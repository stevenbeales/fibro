# frozen_string_literal: true

# Static class that contains Alexa slot samples
class SlotSamples
  # Synonmys for an Entry or an Event
  ENTRY_SLOTS = [
    'entry', 'event'
  ].freeze

  # Synonyms for a Symptom Log
  LOG_SLOTS = [
    'log', 'journal', 'diary', 'symptom log'
  ].freeze

  # Synonyms for reading or speaking
  READ_SLOTS = [
    'read', 'speak', 'say', 'tell'
  ].freeze

  # Fibromyalgia Symptoms
  SYMPTOM_SLOTS = [
    'Fatigue', 'Pain', 'Fogginess', 'Memory', 'Poor Sleep', 'Depression', 'Mood Change',
    'Eyes', 'Light Sensitivity', 'Abdominal Pain', 'Dizzy', 'Balance Problems', 'Headache',
    'Joint Pain', 'Lymph Node Tenderness', 'Sore Throat', 'Other'
  ].freeze
end

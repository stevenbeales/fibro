# frozen_string_literal: true

# Static class that contains the Alexa intent samples

class SampleIntents
  HELP_INTENTS = [
    'Any advice', 'Any tips', 'Do not understand', 'Do you have instructions', 'Get help', 'Help me',
    'Help', 'How can I use you', 'How do I give commands', 'How do I use this app', 'How do I use you',
    'How do you work', 'How does this work', 'I could use help', 'I don\'t know what\'s going on',
    'I don\'t know', 'I\'m confused', 'I\'m lost on what to do', 'I\'m stuck', 'Instructions please',
    'Please advise', 'Please help', 'Repeat again', 'Say again', 'What are you asking about', 'What can I ask you',
    'What can I do', 'What can I use this for', 'What can you do', 'What can you tell me', 'What commands can I ask',
    'What do you do', 'What do you mean', 'What do you refer to', 'What kind of command should I give',
    'What questions can I ask', 'What should I say', 'What type of input should I give'
  ].freeze

  SYMPTOM_INFO_INTENTS = [
    'Get result for {Symptom}',
    'what does it mean if I have {Symptom}',
    'What does it mean to have {Symptom}',
    'Should I be worried if I have {Symptom}',
    'Should I be worried if I am {Symptom}',
    'What if I feel {Symptom}',
    'What are feelings of {Symptom}',
    'Should I go to the doctor if I have {Symptom}',
    'Should I go to the doctor if {Symptom}',
    'Should I be scared if {Symptom}',
    'What could {Symptom} mean',
    'I have {Symptom} what does it mean',
    'Can you tell me about {Symptom}',
    'What is linked to {Symptom}',
    'Do you know anything about {Symptom}',
    'What relates to {Symptom}',
    'What if I have {Symptom}',
    'What could {Symptom} mean',
    'If I feel {Symptom} should I be worried',
    'If I feel {Symptom} what could it be',
    'What are the most popular diagnosis that cause {Symptom}',
    'Will I die if {Symptom}',
    'Is {Symptom} fatal',
    'Could untreated {Symptom} be fatal'
  ].freeze
end
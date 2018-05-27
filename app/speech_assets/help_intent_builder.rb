# frozen_string_literal: true

# Class to build utterances for Help Intent
class HelpIntentBuilder < IntentBuilder
  HELP_INTENTS = [
    'Any advice', 'Any tips', 'Can you help me', 'Do not understand', 'Do you have instructions', 'Get help',
    'Help', 'Help me', 'How can I use you', 'How do I give commands', 'How do I use this app',
    'How do I use you', 'How do you work', 'How does this work', 'I could use help',
    'I don\'t know what\'s going on', 'I don\'t know', 'I\'m confused', 'I\'m lost on what to do',
    'I\'m stuck', 'Instructions please', 'Please advise', 'Please help',
    'What can I answer', 'What can I ask you', 'What can I do', 'What can I use this for',
    'What can you do', 'What can you tell me', 'What commands can I ask',
    'What do you do', 'What do you mean', 'What do you refer to', 'What kind of command should I give',
    'What questions can I ask', 'What should I say', 'What type of input should I give'
  ].freeze

  def add
    add_intents(HELP_INTENTS)
  end
end

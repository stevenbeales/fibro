# frozen_string_literal: true

# Class to build utterances for Help Intent
class HelpIntentBuilder < IntentBuilder
  def add
    intent.add_utterance_template('Any advice')
    intent.add_utterance_template('Any tips')
    intent.add_utterance_template('do not understand')
    intent.add_utterance_template('Do you have instructions')
    intent.add_utterance_template('get help')
    intent.add_utterance_template('help me')
    intent.add_utterance_template('help')
    intent.add_utterance_template('how can I use you')
    intent.add_utterance_template('How do I give commands')
    intent.add_utterance_template('How do I use this app')
    intent.add_utterance_template('how do I use you')
    intent.add_utterance_template('How do you work')
    intent.add_utterance_template('How does this work')
    intent.add_utterance_template('I could use help')
    intent.add_utterance_template('I don\'t know what\'s going on')
    intent.add_utterance_template('I don\'t know')
    intent.add_utterance_template('I\'m confused')
    intent.add_utterance_template('I\'m lost on what to do')
    intent.add_utterance_template('I\'m stuck')
    intent.add_utterance_template('Instructions please')
    intent.add_utterance_template('Please advise')
    intent.add_utterance_template('Please help')
    intent.add_utterance_template('repeat again')
    intent.add_utterance_template('say again')
    intent.add_utterance_template('what are you asking about')
    intent.add_utterance_template('what can I ask you')
    intent.add_utterance_template('what can I do')
    intent.add_utterance_template('what can I use this for')
    intent.add_utterance_template('what can you do')
    intent.add_utterance_template('what can you tell me')
    intent.add_utterance_template('what commands can I ask')
    intent.add_utterance_template('what commands can I say')
    intent.add_utterance_template('what do you do')
    intent.add_utterance_template('what do you mean')
    intent.add_utterance_template('what do you refer to')
    intent.add_utterance_template('What kind of command should I give')
    intent.add_utterance_template('what questions can I ask')
    intent.add_utterance_template('what should I say')
    intent.add_utterance_template('What type of input should I give')
  end
end

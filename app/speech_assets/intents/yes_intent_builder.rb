# frozen_string_literal: true

# Class to build utterances for Yes Intent
class YesIntentBuilder < IntentBuilder
  YES_INTENTS = [
    'Bien Sur',
    'Da',
    'Got it',
    'Let\'s do it',
    'Ja',
    'OK',
    'Okay',
    'Oui',
    'Roger that',
    'Sounds good',
    'Super',
    'Sure',
    'Yep',
    'Yes',
    'Yes please'
  ].freeze

  def add
    add_intents(YES_INTENTS)
  end
end

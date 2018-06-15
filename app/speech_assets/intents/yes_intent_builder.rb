# frozen_string_literal: true

# Class to build utterances for Yes Intent
class YesIntentBuilder < IntentBuilder
  YES_INTENTS = [
    'Absolutely',
    'Affirmative',
    'Agreed',
    'All right',
    'Aye',
    'Aye aye',
    'Bien Sur',
    'By all means',
    'Certainly',
    'Da',
    'Got it',
    'Indeed',
    'Let\'s do it',
    'Ja',
    'Of course',
    'OK',
    'Okay',
    'Okey-doke',
    'Okey-dokey',
    'Oui',
    'Right',
    'Roger',
    'Roger that',
    'Sounds good',
    'Super',
    'Sure',
    'Uh-huh',
    'Very well',
    'Ya',
    'Yea',
    'Yeah',
    'Yep',
    'Yes',
    'Yes please',
    'Yup'
  ].freeze

  def add
    add_intents(YES_INTENTS)
  end
end

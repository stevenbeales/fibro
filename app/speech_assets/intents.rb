# frozen_string_literal: true

# Static class that contains our Alexa intents and their builders in hashes.
class Intents
  CUSTOM_INTENTS = { ConditionIntent: ConditionIntentBuilder,
                     EverybodyHurtsIntent: EverybodyHurtsIntentBuilder,
                     ReadAllIntent: ReadAllIntentBuilder,
                     ReadEntryIntent: ReadEntryIntentBuilder,
                     ReadLastIntent: ReadLastIntentBuilder,
                     SymptomIntent: SymptomIntentBuilder,
                     SymptomInfoIntent: SymptomInfoIntentBuilder }.freeze

  AMAZON_INTENTS = { Cancel: CancelIntentBuilder,
                     Fallback: FallbackIntentBuilder,
                     Help: HelpIntentBuilder,
                     Next: NextIntentBuilder,
                     No: NoIntentBuilder,
                     Pause: PauseIntentBuilder,
                     Previous: PreviousIntentBuilder,
                     Repeat: RepeatIntentBuilder,
                     Resume: ResumeIntentBuilder,
                     StartOver: StartOverIntentBuilder,
                     Stop: StopIntentBuilder,
                     Yes: YesIntentBuilder }.freeze
end

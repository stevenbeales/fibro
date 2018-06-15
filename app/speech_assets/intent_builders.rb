# frozen_string_literal: true

# Static class that contains our Alexa intents and their builders in hashes.
class IntentBuilders
  # Custom Intents hash for use in speech asset generator
  CUSTOM_INTENTS = { ConditionIntent: ConditionIntentBuilder,
                     DeleteEntryIntent: DeleteEntryIntentBuilder,
                     NextEntryIntent: NextEntryIntentBuilder, 
                     ReadAllIntent: ReadAllIntentBuilder,
                     ReadEntryIntent: ReadEntryIntentBuilder,
                     ReadLastIntent: ReadLastIntentBuilder,
                     SymptomIntent: SymptomIntentBuilder,
                     SymptomInfoIntent: SymptomInfoIntentBuilder }.freeze

  # Built-in Amazon Intents hash for use in speech asset generator                  
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

# frozen_string_literal: true

require 'i18n'
require 'i18n/backend/fallbacks'

# support multi-lingual locales
configure do
  I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
  I18n.load_path += Dir[File.join(settings.root, 'config', 'locales', '*.yml')]
  I18n.backend.load_translations
end

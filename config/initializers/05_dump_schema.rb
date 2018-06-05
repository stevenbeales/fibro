# frozen_string_literal: true

# Only dump the schema when adding a new migration.  
ActiveRecord::Base.dump_schema_after_migration = development? && 
                                                 `git status db/migrate/ --porcelain`.present?

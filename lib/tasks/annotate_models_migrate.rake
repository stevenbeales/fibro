# frozen_string_literal: true

# These tasks are added to the project if you install annotate as a Rails plugin.
# (They are not used to build annotate itself.)

# Append annotations to Rake tasks for ActiveRecord, so annotate automatically gets
# run after doing db:migrate.

namespace :db do
  %i[migrate rollback].each do |cmd|
    task cmd do
      Rake::Task['set_annotation_options'].invoke
      Annotate::Migration.update_annotations
    end

    namespace cmd do
      %i[change up down reset redo].each do |t|
        task t do
          Rake::Task['set_annotation_options'].invoke
          Annotate::Migration.update_annotations
        end
      end
    end
  end
end

module Annotate
  # Annotate migrations
  class Migration
    @working = false

    def self.update_annotations
      return if @working || Annotate.skip_on_migration?
      @working = true
      update_models if Annotate.include_models?
      update_routes if Annotate.include_routes?
    end

    def self.update_models
      if Rake::Task.task_defined?('annotate_models')
        Rake::Task['annotate_models'].invoke
      elsif Rake::Task.task_defined?('app:annotate_models')
        Rake::Task['app:annotate_models'].invoke
      end
    end

    def self.update_routes
      Rake::Task['annotate_routes'].invoke if Rake::Task.task_defined?('annotate_routes')
    end
  end
end

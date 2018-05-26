# frozen_string_literal: true

# Migration to create symptom log entries table
class CreateSymptomLogEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :symptom_log_entries, comment: 'Symptom Log Entries table' do |t|
      t.references :symptom_log, null: false, foreign_key: true, index: true
      t.references :symptom, null: false, foreign_key: true, index: true
      t.datetime :entry_date, null: false, index: true, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :severity, null: false, default: 2
      t.integer :score, null: false, default: 5
      t.column :duration, :interval
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :discarded_at
    end

    add_indexes_and_keys
  end

  def add_indexes_and_keys
    add_index :symptom_log_entries, :discarded_at
  end
end

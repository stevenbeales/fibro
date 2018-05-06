# frozen_string_literal: true

# Migration to create symptom log table
class CreateSymptomLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :symptom_logs, comment: 'Symptom Logs table' do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :discarded_at
    end

    add_indexes_and_keys
  end

  def add_indexes_and_keys
    add_index :symptom_logs, :discarded_at
    add_index :symptom_logs, :user, unique: true
  end
end
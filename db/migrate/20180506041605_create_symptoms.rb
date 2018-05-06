# frozen_string_literal: true

# Migration to create symptoms table
class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms, comment: 'Symptoms table' do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ''
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :discarded_at
    end

    add_indexes_and_keys
  end

  def add_indexes_and_keys
    add_index :symptoms, :name, unique: true, name: 'name'
    add_index :symptoms, :discarded_at
  end
end

# frozen_string_literal: true

# Migration to create users table
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: 'Users table' do |t|
      t.string :user_id, null: false
      t.text :access_token, null: false, default: ''
      t.timestamps null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :discarded_at
    end

    add_indexes_and_keys
  end

  def add_indexes_and_keys
    add_index :users, :user_id, unique: true, name: 'user_id'
    add_index :users, :discarded_at
  end
end

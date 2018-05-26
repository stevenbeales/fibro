# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_06_042531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "symptom_log_entries", comment: "Symptom Log Entries table", force: :cascade do |t|
    t.bigint "symptom_log_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "entry_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "severity", default: 2, null: false
    t.integer "score", default: 5, null: false
    t.interval "duration"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_symptom_log_entries_on_discarded_at"
    t.index ["entry_date"], name: "index_symptom_log_entries_on_entry_date"
    t.index ["symptom_id"], name: "index_symptom_log_entries_on_symptom_id"
    t.index ["symptom_log_id"], name: "index_symptom_log_entries_on_symptom_log_id"
  end

  create_table "symptom_logs", comment: "Symptom Logs table", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_symptom_logs_on_discarded_at"
    t.index ["user_id"], name: "index_symptom_logs_on_user_id"
  end

  create_table "symptoms", comment: "Symptoms table", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_symptoms_on_discarded_at"
    t.index ["name"], name: "name", unique: true
  end

  create_table "users", comment: "Users table", force: :cascade do |t|
    t.string "user_id", null: false
    t.text "access_token", default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["user_id"], name: "user_id", unique: true
  end

  add_foreign_key "symptom_log_entries", "symptom_logs"
  add_foreign_key "symptom_log_entries", "symptoms"
  add_foreign_key "symptom_logs", "users"
end

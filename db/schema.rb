# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140423141522) do

  create_table "expense_types", force: true do |t|
    t.string   "name"
    t.integer  "parent_expense_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expense_types", ["parent_expense_type_id"], name: "index_expense_types_on_parent_expense_type_id"

  create_table "expenses", force: true do |t|
    t.integer  "amount"
    t.string   "note"
    t.integer  "expense_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["expense_type_id"], name: "index_expenses_on_expense_type_id"

  create_table "income_types", force: true do |t|
    t.string   "name"
    t.integer  "parent_income_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "income_types", ["parent_income_type_id"], name: "index_income_types_on_parent_income_type_id"

  create_table "incomes", force: true do |t|
    t.integer  "amount"
    t.text     "note"
    t.integer  "income_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incomes", ["income_type_id"], name: "index_incomes_on_income_type_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end

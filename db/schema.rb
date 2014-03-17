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

ActiveRecord::Schema.define(version: 20140317114926) do

  create_table "income_types", force: true do |t|
    t.string   "name"
    t.integer  "parent_income_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "income_id"
  end

  add_index "income_types", ["income_id"], name: "index_income_types_on_income_id"
  add_index "income_types", ["parent_income_type_id"], name: "index_income_types_on_parent_income_type_id"

  create_table "incomes", force: true do |t|
    t.integer  "amount"
    t.text     "note"
    t.integer  "income_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incomes", ["income_type_id"], name: "index_incomes_on_income_type_id"

end

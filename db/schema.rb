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

ActiveRecord::Schema.define(version: 20140830155136) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.text     "description"
    t.decimal  "lat",         precision: 10, scale: 6
    t.decimal  "lng",         precision: 10, scale: 6
  end

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "deals", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "federation_id"
    t.string   "cached_federation_name"
    t.integer  "local_user_id"
    t.integer  "local_account_id"
    t.string   "deal_image"
    t.integer  "category_id"
  end

  add_index "deals", ["category_id"], name: "index_deals_on_category_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.integer  "current_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end

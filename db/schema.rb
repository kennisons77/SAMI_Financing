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

ActiveRecord::Schema.define(version: 20150129205531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: true do |t|
    t.decimal  "amount",     precision: 15, scale: 2,               null: false
    t.decimal  "fulfilled",  precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "lender_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agreements", ["lender_id"], name: "index_agreements_on_lender_id", using: :btree
  add_index "agreements", ["target_id"], name: "index_agreements_on_target_id", using: :btree

  create_table "borrowers", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: true do |t|
    t.string   "collateral"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true, null: false
    t.integer  "term"
  end

  create_table "documents", force: true do |t|
    t.integer  "deal_id"
    t.string   "title",      null: false
    t.integer  "type"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["deal_id"], name: "index_documents_on_deal_id", using: :btree

  create_table "lenders", force: true do |t|
    t.string   "title",                     null: false
    t.integer  "account",                   null: false
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signers", force: true do |t|
    t.integer  "lender_id"
    t.string   "first",                     null: false
    t.string   "last",                      null: false
    t.string   "email",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signers", ["lender_id"], name: "index_signers_on_lender_id", using: :btree

  create_table "targets", force: true do |t|
    t.decimal  "amount",      precision: 15, scale: 2, null: false
    t.decimal  "yield",       precision: 7,  scale: 2, null: false
    t.integer  "borrower_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "targets", ["borrower_id"], name: "index_targets_on_borrower_id", using: :btree
  add_index "targets", ["deal_id"], name: "index_targets_on_deal_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

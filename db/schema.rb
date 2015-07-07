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

ActiveRecord::Schema.define(version: 601) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nom",                limit: 255,                 null: false
    t.string   "question",           limit: 255,                 null: false
    t.string   "description",        limit: 255
    t.boolean  "is_serious",         limit: 1,   default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "icone_file_name",    limit: 255
    t.string   "icone_content_type", limit: 255
    t.integer  "icone_file_size",    limit: 4
    t.datetime "icone_updated_at"
  end

  create_table "joueur_modes", force: :cascade do |t|
    t.integer "joueur_id", limit: 4, null: false
    t.integer "mode_id",   limit: 4, null: false
  end

  add_index "joueur_modes", ["joueur_id"], name: "fk_rails_8392a75f12", using: :btree
  add_index "joueur_modes", ["mode_id"], name: "fk_rails_5fb5423b4c", using: :btree

  create_table "joueur_modes_categories", force: :cascade do |t|
    t.integer  "joueur_mode_id", limit: 4,  null: false
    t.integer  "category_id",    limit: 4,  null: false
    t.float    "elo",            limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "joueur_modes_categories", ["category_id"], name: "fk_rails_e8f9e8f10b", using: :btree
  add_index "joueur_modes_categories", ["joueur_mode_id"], name: "fk_rails_b1d7cd3feb", using: :btree

  create_table "joueurs", force: :cascade do |t|
    t.string   "pseudo",     limit: 255, null: false
    t.boolean  "is_active",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "modes", force: :cascade do |t|
    t.string   "nom",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.string   "pseudo",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tops", force: :cascade do |t|
    t.integer  "rang",       limit: 4,  null: false
    t.integer  "joueur_id",  limit: 4,  null: false
    t.integer  "mode_id",    limit: 4,  null: false
    t.float    "elo",        limit: 24, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "joueur_modes", "joueurs", on_delete: :cascade
  add_foreign_key "joueur_modes", "modes", on_delete: :cascade
  add_foreign_key "joueur_modes_categories", "categories", on_delete: :cascade
  add_foreign_key "joueur_modes_categories", "joueur_modes", on_delete: :cascade
end

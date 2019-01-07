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

ActiveRecord::Schema.define(version: 2019_01_05_212913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "information_types", force: :cascade do |t|
    t.string "description"
    t.integer "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sugestions", force: :cascade do |t|
    t.integer "flag"
    t.bigint "user_id"
    t.bigint "user_information_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sugestions_on_user_id"
    t.index ["user_information_type_id"], name: "index_sugestions_on_user_information_type_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["user_id"], name: "index_taggings_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_information_types", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "information_type_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "flag", default: 0
    t.index ["information_type_id"], name: "index_user_information_types_on_information_type_id"
    t.index ["user_id"], name: "index_user_information_types_on_user_id"
  end

  create_table "user_informations", force: :cascade do |t|
    t.string "description"
    t.integer "flag"
    t.bigint "user_information_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_information_type_id"], name: "index_user_informations_on_user_information_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sugestions", "user_information_types"
  add_foreign_key "sugestions", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "users"
  add_foreign_key "user_information_types", "information_types"
  add_foreign_key "user_information_types", "users"
  add_foreign_key "user_informations", "user_information_types"
end

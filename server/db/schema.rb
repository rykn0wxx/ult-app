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

ActiveRecord::Schema.define(version: 2019_06_05_211257) do

  create_table "boards", force: :cascade do |t|
    t.string "board_name", limit: 20, default: "", null: false
    t.string "board_description", default: "", null: false
    t.integer "user_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_content", limit: 50, default: "", null: false
    t.integer "list_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name", limit: 50, default: "", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_name"], name: "index_groups_on_group_name", unique: true
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "list_name", limit: 20, default: "", null: false
    t.string "list_description", default: "", null: false
    t.integer "board_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", limit: 20, default: "", null: false
    t.string "user_email", limit: 50, default: "", null: false
    t.boolean "admin", default: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_email"], name: "index_users_on_user_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

end

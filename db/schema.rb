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

ActiveRecord::Schema.define(version: 2019_05_26_143248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.boolean "host", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "event_invites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_invites_on_event_id"
    t.index ["user_id"], name: "index_event_invites_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "game_id"
    t.text "date_time"
    t.string "location"
    t.string "game_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_events_on_game_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "game_mechanics", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "mechanic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_mechanics_on_game_id"
    t.index ["mechanic_id"], name: "index_game_mechanics_on_mechanic_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "min_players", default: 0
    t.integer "max_players", default: 0
    t.integer "min_playtime", default: 0
    t.integer "max_playtime", default: 0
    t.string "description", default: "Description unavailable"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bga_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.string "bga_id"
    t.integer "agg_score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_ownerships_on_game_id"
    t.index ["user_id"], name: "index_ownerships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "events"
  add_foreign_key "attendances", "users"
  add_foreign_key "event_invites", "events"
  add_foreign_key "event_invites", "users"
  add_foreign_key "events", "games"
  add_foreign_key "game_mechanics", "games"
  add_foreign_key "game_mechanics", "mechanics"
  add_foreign_key "ownerships", "games"
  add_foreign_key "ownerships", "users"
end

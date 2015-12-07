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

ActiveRecord::Schema.define(version: 20151207163501) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title"
    t.text     "description"
    t.datetime "deadline"
  end

  create_table "avatars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "face"
    t.integer "head"
    t.integer "color"
  end

  create_table "challenges", force: :cascade do |t|
    t.text     "text"
    t.string   "answer"
    t.integer  "quest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "context_trackers", force: :cascade do |t|
    t.integer "context_id"
    t.integer "tracker_id"
    t.integer "data"
  end

  create_table "contexts", force: :cascade do |t|
    t.string  "name"
    t.integer "creator_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "forum_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "user_id"
    t.string  "title"
    t.text    "description"
    t.string  "instructor"
    t.string  "assistant_instructor"
  end

  create_table "developer_log_entries", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "datetime"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.integer  "outpost_id"
    t.integer  "founder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.text     "description"
    t.text     "how_to_test"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "creator_id"
    t.string   "category"
    t.string   "target_version"
    t.string   "subject"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "units"
    t.integer  "creator_id"
  end

  create_table "lumber_yards", force: :cascade do |t|
    t.integer  "outpost_id"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outposts", force: :cascade do |t|
    t.integer  "world_id"
    t.integer  "founder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plane_of_worlds_profiles", force: :cascade do |t|
    t.string  "alias"
    t.integer "current_world_id"
    t.integer "portal_points"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "species"
    t.date     "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
  end

  create_table "players", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
    t.integer "world_id"
    t.integer "mana"
    t.integer "influence"
    t.integer "leader_id"
  end

  create_table "poops", force: :cascade do |t|
    t.datetime "time"
    t.integer  "rating"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "conversation_id"
    t.text     "content"
    t.integer  "poster_id"
    t.integer  "parent_post_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "need"
    t.float    "cost"
    t.datetime "purchased_at"
    t.text     "purchase_link"
  end

  create_table "quests", force: :cascade do |t|
    t.string   "title"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "published"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "assignee_id"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string "title"
    t.string "filename"
    t.string "content_type"
    t.binary "file_contents"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "inventory_id"
    t.integer  "item_id"
    t.float    "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.boolean  "complete"
    t.string   "subject"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "assignee_id"
    t.string   "notes"
    t.integer  "creator_id"
  end

  create_table "towers", force: :cascade do |t|
    t.integer  "outpost_id"
    t.integer  "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.integer "privilege_level"
    t.string  "favorite_color"
    t.boolean "show_header",     default: true
  end

  create_table "worlds", force: :cascade do |t|
    t.string  "name"
    t.integer "discoverer_id"
    t.integer "portal_1_id"
    t.integer "portal_2_id"
    t.integer "portal_3_id"
    t.integer "portal_4_id"
  end

end

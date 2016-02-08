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

ActiveRecord::Schema.define(version: 20160208012124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "course_id"
    t.string  "title"
    t.text    "description"
    t.date    "due_date"
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
    t.string  "icon"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "user_id"
    t.string  "title"
    t.string  "instructor"
    t.string  "schedule"
    t.string  "location"
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "topic"
    t.text     "description"
    t.datetime "datetime"
    t.string   "location"
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
    t.integer  "context_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "units"
    t.integer  "creator_id"
    t.integer  "context_id"
  end

  create_table "log_entries", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "datetime"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "context_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "species"
    t.date     "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
    t.integer  "context_id"
  end

  create_table "poops", force: :cascade do |t|
    t.datetime "time"
    t.integer  "rating"
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

  create_table "readings", force: :cascade do |t|
    t.text    "description"
    t.date    "due_date"
    t.integer "course_id"
    t.string  "topic"
  end

  create_table "resource_inclusions", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "resourceful_id"
    t.string  "resourceful_type"
  end

  create_table "resources", force: :cascade do |t|
    t.string "url"
    t.text   "description"
    t.string "type"
    t.string "filename"
    t.string "content_type"
    t.binary "file_contents"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "assignee_id"
    t.integer  "creator_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "context_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string  "title"
    t.string  "filename"
    t.string  "content_type"
    t.binary  "file_contents"
    t.integer "context_id"
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
    t.integer  "context_id"
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

end

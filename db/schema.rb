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

ActiveRecord::Schema.define(version: 20150628190458) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "title"
    t.text     "description"
    t.datetime "deadline"
  end

  create_table "commands", force: :cascade do |t|
    t.string   "command_text"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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

  create_table "issues", force: :cascade do |t|
    t.text     "description"
    t.text     "how_to_test"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "completed"
    t.integer  "creator_id"
    t.integer  "assignee_id"
    t.integer  "tester_id"
    t.string   "category"
    t.datetime "tested_at"
    t.datetime "completed_at"
    t.datetime "assigned_at"
    t.string   "target_version"
    t.string   "title"
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
  end

  create_table "players", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
    t.integer "world_id"
    t.integer "mana"
    t.integer "influence"
  end

  create_table "portals", force: :cascade do |t|
    t.integer "origin_world_id"
    t.integer "destination_world_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "need"
    t.float    "cost"
    t.datetime "purchased_at"
    t.text     "purchase_link"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "privilege_level"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "favorite_color"
    t.boolean  "show_header",         default: true
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

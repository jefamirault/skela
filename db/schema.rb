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

ActiveRecord::Schema.define(version: 20160508233708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "course_id"
    t.string  "title"
    t.text    "notes"
    t.date    "date"
  end

  create_table "avatars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "face"
    t.integer "head"
    t.integer "color"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "user_id"
    t.string  "title"
    t.string  "instructor"
    t.string  "schedule"
    t.string  "location"
    t.string  "instructor_email"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "course_id"
    t.string  "title"
    t.text    "notes"
    t.date    "date"
    t.string  "location"
    t.time    "time"
  end

  create_table "readings", force: :cascade do |t|
    t.text    "title"
    t.date    "date"
    t.integer "course_id"
    t.string  "topic"
    t.text    "notes"
  end

  create_table "resource_inclusions", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "resourceful_id"
    t.string  "resourceful_type"
  end

  create_table "resources", force: :cascade do |t|
    t.string  "url"
    t.text    "title"
    t.string  "type"
    t.string  "filename"
    t.string  "content_type"
    t.binary  "file_contents"
    t.integer "course_id"
    t.text    "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "show_header",     default: true
    t.boolean  "admin"
    t.datetime "last_active"
  end

end

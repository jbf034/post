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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131204135654) do

  create_table "admins", :force => true do |t|
    t.string   "manage"
    t.string   "password"
    t.string   "manage_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "attachments", :force => true do |t|
    t.string   "file_name"
    t.string   "content_type"
    t.string   "file_size"
    t.string   "attachmentable_type"
    t.integer  "attachmentable_id"
    t.string   "attachment"
    t.integer  "grade",               :default => 0
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "bjs", :force => true do |t|
    t.integer  "bj_num",     :limit => 255
    t.string   "bj_name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.integer  "bj_id",      :limit => 255
    t.text     "content"
    t.string   "name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end

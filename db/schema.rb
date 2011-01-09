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

ActiveRecord::Schema.define(:version => 20110109125643) do

  create_table "attendances", :force => true do |t|
    t.integer  "attendant_id", :null => false
    t.integer  "event_id",     :null => false
    t.string   "comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "attendances", ["attendant_id", "event_id"], :name => "attendances_attendant_id_event_id_unique_index", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "body",             :null => false
    t.integer  "author_id",        :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "events", :force => true do |t|
    t.datetime "starting_at"
    t.text     "description"
    t.string   "title"
    t.string   "place"
    t.integer  "organizer_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "submissions", :force => true do |t|
    t.integer  "author_id",   :null => false
    t.integer  "event_id",    :null => false
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "submission_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "votes", ["user_id"], :name => "index_votes_on_user_id", :unique => true

  add_foreign_key "attendances", ["attendant_id"], "users", ["id"], :name => "attendances_attendant_id_fkey"
  add_foreign_key "attendances", ["event_id"], "events", ["id"], :name => "attendances_event_id_fkey"

  add_foreign_key "comments", ["author_id"], "users", ["id"], :name => "comments_author_id_fkey"

  add_foreign_key "events", ["organizer_id"], "users", ["id"], :name => "events_organizer_id_fkey"

  add_foreign_key "submissions", ["author_id"], "users", ["id"], :name => "submissions_author_id_fkey"
  add_foreign_key "submissions", ["event_id"], "events", ["id"], :name => "submissions_event_id_fkey"

  add_foreign_key "votes", ["user_id"], "users", ["id"], :name => "votes_user_id_fkey"
  add_foreign_key "votes", ["submission_id"], "submissions", ["id"], :name => "votes_submission_id_fkey"

end

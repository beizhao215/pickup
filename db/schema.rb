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

ActiveRecord::Schema.define(:version => 20120520161411) do

  create_table "posts", :force => true do |t|
    t.string   "note"
    t.integer  "user_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "number_of_people"
    t.date     "arrival_date"
    t.time     "arrival_time"
    t.string   "flight_number"
    t.string   "luggage_number"
    t.string   "destination"
    t.boolean  "status",                   :default => false
    t.boolean  "need_housing"
    t.string   "entry_port"
    t.boolean  "need_pickup"
    t.string   "temp_housing_arrangement"
  end

  add_index "posts", ["arrival_date", "arrival_time", "flight_number"], :name => "index_posts_on_arrival_date_and_arrival_time_and_flight_number"
  add_index "posts", ["need_pickup", "entry_port"], :name => "index_posts_on_need_pickup_and_entry_port"
  add_index "posts", ["status", "need_housing"], :name => "index_posts_on_status_and_need_housing"
  add_index "posts", ["temp_housing_arrangement"], :name => "index_posts_on_temp_housing_arrangement"
  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id_and_created_at"

  create_table "trips", :force => true do |t|
    t.integer  "pickedpost_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "trips", ["pickedpost_id"], :name => "index_trips_on_pickedpost_id"
  add_index "trips", ["volunteer_id", "pickedpost_id"], :name => "index_trips_on_volunteer_id_and_pickedpost_id", :unique => true
  add_index "trips", ["volunteer_id"], :name => "index_trips_on_volunteer_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                 :default => false
    t.boolean  "newbie"
    t.string   "qq"
    t.string   "phone"
    t.string   "renren"
    t.boolean  "gender"
    t.boolean  "provide_housing"
    t.integer  "housing_number"
    t.string   "available_pickup_time"
    t.string   "major"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["gender", "newbie", "provide_housing", "major"], :name => "index_users_on_gender_and_newbie_and_provide_housing_and_major"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

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

ActiveRecord::Schema.define(:version => 20131002043544) do

  create_table "entrepreneurs", :force => true do |t|
    t.string   "first_name",     :null => false
    t.string   "last_name",      :null => false
    t.string   "location"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "slug"
    t.string   "filepicker_url"
  end

  add_index "entrepreneurs", ["slug"], :name => "index_entrepreneurs_on_slug", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "investor_groupings", :force => true do |t|
    t.integer  "investor_id", :null => false
    t.integer  "group_id",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "investor_groups", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loans", :force => true do |t|
    t.integer  "entrepreneur_id",                                                :null => false
    t.integer  "lender_id",                                                      :null => false
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.integer  "project_id",                                                     :null => false
    t.decimal  "principal",       :precision => 8, :scale => 2,                  :null => false
    t.decimal  "interest",        :precision => 8, :scale => 2, :default => 0.0, :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "loan_id",                                  :null => false
    t.integer  "payer_id",                                 :null => false
    t.decimal  "amount",     :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "entrepreneur_id",  :null => false
    t.string   "title",            :null => false
    t.text     "description"
    t.decimal  "fundraising_goal", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tour_meetings", :force => true do |t|
    t.integer  "entrepreneur_id", :null => false
    t.integer  "tour_id",         :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tour_sign_ups", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "tour_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tours", :force => true do |t|
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "date"
  end

  create_table "updates", :force => true do |t|
    t.integer  "project_id", :null => false
    t.integer  "author_id",  :null => false
    t.string   "title",      :null => false
    t.text     "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "role",                   :default => "user", :null => false
    t.string   "first_name",                                 :null => false
    t.string   "last_name",                                  :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

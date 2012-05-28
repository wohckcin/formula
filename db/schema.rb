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

ActiveRecord::Schema.define(:version => 20120528123312) do

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "likes", ["likeable_id"], :name => "index_likes_on_likeable_id"
  add_index "likes", ["likeable_type"], :name => "index_likes_on_likeable_type"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "nodes", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "status"
    t.integer  "section_id"
    t.text     "description"
    t.integer  "postion_at",   :default => 0, :null => false
    t.integer  "topics_count", :default => 0, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "nodes", ["section_id"], :name => "index_nodes_on_section_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "gender"
    t.date     "birthday"
    t.text     "bio"
    t.string   "tagline"
    t.string   "avatar"
    t.string   "location"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content"
    t.text     "content_html"
    t.integer  "likes_count",  :default => 0, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "replies", ["topic_id"], :name => "index_replies_on_topic_id"
  add_index "replies", ["user_id"], :name => "index_replies_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "title_alternative"
    t.text     "description"
    t.integer  "postion_at",        :default => 0, :null => false
    t.integer  "nodes_count",       :default => 0, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.text     "content_html"
    t.string   "type"
    t.integer  "node_id"
    t.integer  "replies_count", :default => 0, :null => false
    t.integer  "likes_count",   :default => 0, :null => false
    t.integer  "views_count",   :default => 0, :null => false
    t.datetime "replied_at"
    t.datetime "sticky_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "topics", ["node_id"], :name => "index_topics_on_node_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username",               :default => "", :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end

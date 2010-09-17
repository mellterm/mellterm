# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100917093605) do

  create_table "attachments", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "user_id"
    t.boolean  "is_private",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "categories_translations", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "translation_id"
  end

  add_index "categories_translations", ["category_id", "translation_id"], :name => "index_categories_translations_on_category_id_and_translation_id"
  add_index "categories_translations", ["category_id"], :name => "index_categories_translations_on_category_id"
  add_index "categories_translations", ["translation_id"], :name => "index_categories_translations_on_translation_id"

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "body"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_order",     :default => 1
    t.string   "link_title"
    t.text     "header_content"
    t.string   "location",       :default => "page"
    t.integer  "display_order",  :default => 1
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "segments", :force => true do |t|
    t.string   "source_content"
    t.string   "target_content"
    t.integer  "source_language_id"
    t.integer  "target_language_id"
    t.integer  "category_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "cru"
    t.string   "crd"
    t.text     "notes"
    t.text     "raw_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "var"
    t.text     "value"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["var"], :name => "index_settings_on_var", :unique => true

  create_table "translations", :force => true do |t|
    t.string   "source_content"
    t.string   "target_content"
    t.integer  "source_language_id"
    t.integer  "target_language_id"
    t.integer  "company_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "internal_id"
    t.string   "source"
  end

  add_index "translations", ["company_id"], :name => "index_translations_on_company_id"
  add_index "translations", ["source_language_id"], :name => "index_translations_on_source_language_id"
  add_index "translations", ["target_language_id"], :name => "index_translations_on_target_language_id"
  add_index "translations", ["user_id"], :name => "index_translations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "admin",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "time_zone"
    t.text     "notes"
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end

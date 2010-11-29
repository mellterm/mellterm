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

ActiveRecord::Schema.define(:version => 20101129190948) do

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
    t.integer  "parent_id"
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

  create_table "document_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "date_updated_at"
    t.string   "xliff_xmlns"
    t.string   "xliff_version"
    t.string   "xliff_original"
    t.string   "xliff_source_language"
    t.string   "xliff_datatype"
    t.string   "xliff_tool"
    t.string   "xliff_tool_id"
    t.string   "xliff_date"
    t.string   "xliff_xml_space"
    t.string   "xliff_ts"
    t.string   "xliff_category"
    t.string   "xliff_target_language"
    t.string   "xliff_product_name"
    t.string   "xliff_product_version"
    t.string   "xliff_build_num"
    t.string   "file_encoding"
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "category_id"
    t.integer  "company_id"
    t.integer  "language_id"
    t.boolean  "public",                :default => false
    t.boolean  "assigned",              :default => false
    t.boolean  "completed",             :default => false
    t.datetime "expires_at"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["assigned"], :name => "index_documents_on_assigned"
  add_index "documents", ["category_id"], :name => "index_documents_on_category_id"
  add_index "documents", ["company_id"], :name => "index_documents_on_company_id"
  add_index "documents", ["completed"], :name => "index_documents_on_completed"
  add_index "documents", ["language_id"], :name => "index_documents_on_language_id"
  add_index "documents", ["public"], :name => "index_documents_on_public"
  add_index "documents", ["team_id"], :name => "index_documents_on_team_id"
  add_index "documents", ["user_id"], :name => "index_documents_on_user_id"

  create_table "languages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
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

  create_table "projects", :force => true do |t|
    t.integer  "company_id"
    t.integer  "pt_status_id"
    t.boolean  "approved",     :default => false
    t.date     "start_date"
    t.date     "due_date"
    t.text     "instruction"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_users", :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "pt_statuses", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "segment_statuses", :force => true do |t|
    t.string "name"
  end

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
    t.integer  "document_id"
    t.integer  "updated_by"
    t.integer  "reviewer_id"
    t.integer  "translator_id"
    t.string   "status_id"
    t.boolean  "approved",           :default => false
    t.integer  "task_id"
  end

  add_index "segments", ["category_id"], :name => "index_segments_on_category_id"
  add_index "segments", ["company_id"], :name => "index_segments_on_company_id"
  add_index "segments", ["document_id"], :name => "index_segments_on_document_id"
  add_index "segments", ["reviewer_id"], :name => "index_segments_on_reviewer_id"
  add_index "segments", ["source_language_id"], :name => "index_segments_on_source_language_id"
  add_index "segments", ["status_id"], :name => "index_segments_on_status_id"
  add_index "segments", ["target_language_id"], :name => "index_segments_on_target_language_id"
  add_index "segments", ["translator_id"], :name => "index_segments_on_translator_id"
  add_index "segments", ["updated_by"], :name => "index_segments_on_updated_by"
  add_index "segments", ["user_id"], :name => "index_segments_on_user_id"

  create_table "settings", :force => true do |t|
    t.string   "var"
    t.text     "value"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["var"], :name => "index_settings_on_var", :unique => true

  create_table "tasks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "pt_status_id"
    t.boolean  "approved",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks_users", :force => true do |t|
    t.integer "task_id"
    t.integer "user_id"
  end

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
    t.string   "type"
    t.boolean  "approved",           :default => false
    t.boolean  "is_public",          :default => true
    t.string   "pos"
    t.integer  "authority"
    t.string   "doc_name"
    t.integer  "document_id"
  end

  add_index "translations", ["company_id"], :name => "index_translations_on_company_id"
  add_index "translations", ["id", "type"], :name => "index_translations_on_id_and_type"
  add_index "translations", ["source_language_id"], :name => "index_translations_on_source_language_id"
  add_index "translations", ["target_language_id"], :name => "index_translations_on_target_language_id"
  add_index "translations", ["type"], :name => "index_translations_on_type"
  add_index "translations", ["user_id"], :name => "index_translations_on_user_id"

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :default => "",    :null => false
    t.string   "email",               :default => "",    :null => false
    t.string   "crypted_password",    :default => "",    :null => false
    t.string   "password_salt",       :default => "",    :null => false
    t.string   "persistence_token",   :default => "",    :null => false
    t.string   "single_access_token", :default => "",    :null => false
    t.string   "perishable_token",    :default => "",    :null => false
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
    t.string   "name_title"
    t.integer  "language_id"
    t.integer  "user_type_id"
    t.string   "country_name"
    t.string   "skype"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["language_id"], :name => "index_users_on_language_id"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["user_type_id"], :name => "index_users_on_user_type_id"

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "changes"
    t.integer  "number"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

end

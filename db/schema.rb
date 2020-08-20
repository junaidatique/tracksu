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

ActiveRecord::Schema.define(version: 20170324192154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "activity_date"
    t.string   "customer_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "duration"
    t.string   "activity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "place_id"
    t.text     "comment"
    t.string   "local_id"
    t.index ["place_id"], name: "index_activities_on_place_id", using: :btree
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "activities_purposes", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "purpose_id"
    t.index ["activity_id"], name: "index_activities_purposes_on_activity_id", using: :btree
    t.index ["purpose_id"], name: "index_activities_purposes_on_purpose_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "activated"
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.text     "comments"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_histories_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_histories_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "customer_type"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "external_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address"
    t.string   "local_id"
    t.index ["company_id"], name: "index_places_on_company_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.boolean  "activated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_products_on_company_id", using: :btree
  end

  create_table "purposes", force: :cascade do |t|
    t.string   "title"
    t.boolean  "activated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_purposes_on_company_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "saleproducts", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "product_id"
    t.float    "rate"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_saleproducts_on_activity_id", using: :btree
    t.index ["product_id"], name: "index_saleproducts_on_product_id", using: :btree
  end

  create_table "tracking_points", force: :cascade do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "local_id"
    t.index ["user_id"], name: "index_tracking_points_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id"
    t.string   "name"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "activities", "places"
  add_foreign_key "activities", "users"
  add_foreign_key "histories", "activities"
  add_foreign_key "histories", "users"
  add_foreign_key "places", "companies"
  add_foreign_key "products", "companies"
  add_foreign_key "purposes", "companies"
  add_foreign_key "saleproducts", "activities"
  add_foreign_key "saleproducts", "products"
  add_foreign_key "tracking_points", "users"
  add_foreign_key "users", "companies"
end

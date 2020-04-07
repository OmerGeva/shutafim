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

ActiveRecord::Schema.define(version: 2020_04_07_191405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.boolean "wifi"
    t.boolean "dishwasher"
    t.boolean "laundry_washer"
    t.boolean "laundry_dryer"
    t.boolean "cats_ok"
    t.boolean "dogs_ok"
    t.boolean "air_conditioner"
  end

  create_table "apartments", force: :cascade do |t|
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "total_rooms"
    t.string "description"
    t.string "type"
    t.string "street_address"
    t.bigint "city_id"
    t.bigint "amenity_id"
    t.string "photo"
    t.index ["amenity_id"], name: "index_apartments_on_amenity_id"
    t.index ["city_id"], name: "index_apartments_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "contract_agreements", force: :cascade do |t|
    t.bigint "user_id"
    t.index ["user_id"], name: "index_contract_agreements_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "duration"
    t.bigint "apartment_id"
    t.bigint "contract_agreement_id"
    t.index ["apartment_id"], name: "index_listings_on_apartment_id"
    t.index ["contract_agreement_id"], name: "index_listings_on_contract_agreement_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_neighborhoods_on_city_id"
  end

  create_table "open_house_appts", force: :cascade do |t|
    t.boolean "checked_in"
    t.time "time_entered"
    t.time "time_left"
    t.bigint "user_id"
    t.bigint "open_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["open_house_id"], name: "index_open_house_appts_on_open_house_id"
    t.index ["user_id"], name: "index_open_house_appts_on_user_id"
  end

  create_table "open_houses", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_open_houses_on_listing_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profession"
    t.string "about_me"
    t.string "gender"
    t.bigint "trait_id"
    t.bigint "user_id"
    t.index ["trait_id"], name: "index_profiles_on_trait_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "apartment_id"
    t.index ["apartment_id"], name: "index_rooms_on_apartment_id"
  end

  create_table "traits", force: :cascade do |t|
    t.boolean "smokes"
    t.boolean "has_cat"
    t.boolean "has_dog"
    t.boolean "veg"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_number"
    t.integer "dob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apartments", "amenities"
  add_foreign_key "apartments", "cities"
  add_foreign_key "listings", "apartments"
  add_foreign_key "listings", "contract_agreements"
  add_foreign_key "listings", "users"
  add_foreign_key "open_house_appts", "open_houses"
  add_foreign_key "open_house_appts", "users"
  add_foreign_key "open_houses", "listings"
  add_foreign_key "rooms", "apartments"
end

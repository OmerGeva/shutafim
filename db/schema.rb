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

ActiveRecord::Schema.define(version: 2020_04_06_232844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "cities_id"
    t.bigint "amenities_id"
    t.string "photo"
    t.index ["amenities_id"], name: "index_apartments_on_amenities_id"
    t.index ["cities_id"], name: "index_apartments_on_cities_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "neighborhoods_id"
    t.index ["neighborhoods_id"], name: "index_cities_on_neighborhoods_id"
  end

  create_table "contract_agreements", force: :cascade do |t|
    t.bigint "users_id"
    t.index ["users_id"], name: "index_contract_agreements_on_users_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "duration"
    t.bigint "apartments_id"
    t.bigint "contract_agreements_id"
    t.index ["apartments_id"], name: "index_listings_on_apartments_id"
    t.index ["contract_agreements_id"], name: "index_listings_on_contract_agreements_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
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
    t.string "photo"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "apartments_id"
    t.index ["apartments_id"], name: "index_rooms_on_apartments_id"
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
    t.bigint "profiles_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profiles_id"], name: "index_users_on_profiles_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apartments", "amenities", column: "amenities_id"
  add_foreign_key "apartments", "cities", column: "cities_id"
  add_foreign_key "cities", "neighborhoods", column: "neighborhoods_id"
  add_foreign_key "listings", "apartments", column: "apartments_id"
  add_foreign_key "listings", "contract_agreements", column: "contract_agreements_id"
  add_foreign_key "listings", "users"
  add_foreign_key "open_house_appts", "open_houses"
  add_foreign_key "open_house_appts", "users"
  add_foreign_key "open_houses", "listings"
  add_foreign_key "rooms", "apartments", column: "apartments_id"
  add_foreign_key "users", "profiles", column: "profiles_id"
end

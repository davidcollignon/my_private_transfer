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

ActiveRecord::Schema.define(version: 2019_03_06_095956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beneficiaries", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "language"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "company_id"
    t.string "brand"
    t.text "description"
    t.integer "passenger_capacity"
    t.integer "luggage_capacity"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_per_km_cents", default: 0, null: false
    t.integer "price_per_hour_cents", default: 0, null: false
    t.index ["company_id"], name: "index_cars_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "user_id"
    t.datetime "pick_up_date"
    t.integer "final_price_cents", default: 0, null: false
    t.string "status"
    t.jsonb "payment"
    t.string "flight_number"
    t.string "driver_language", default: "English"
    t.integer "number_of_passengers"
    t.integer "number_normal_luggage", default: 0
    t.integer "number_odd_luggage", default: 0
    t.text "description_odd_luggage"
    t.integer "number_hand_luggage", default: 0
    t.text "additional_info"
    t.float "commission_rate", default: 0.0
    t.string "service_type"
    t.string "pick_up_address"
    t.string "destination_address"
    t.float "number_hours_at_disposal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.boolean "rating"
    t.text "comment"
    t.index ["car_id"], name: "index_services_on_car_id"
    t.index ["user_id"], name: "index_services_on_user_id"
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
    t.string "agency"
    t.string "agency_address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "companies"
  add_foreign_key "services", "cars"
  add_foreign_key "services", "users"
end

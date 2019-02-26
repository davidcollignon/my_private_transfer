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

ActiveRecord::Schema.define(version: 2019_02_25_162621) do
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
    t.float "price_per_hour"
    t.float "price_per_km"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_cars_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "car_id"
    t.bigint "user_id"
    t.bigint "beneficiary_id"
    t.datetime "pick_up_date"
    t.float "final_price"
    t.string "status"
    t.string "flight_number"
    t.integer "number_of_passengers"
    t.integer "number_normal_luggage"
    t.integer "number_odd_luggage"
    t.text "description_odd_luggage"
    t.integer "number_hand_luggage"
    t.string "additional_info"
    t.float "commission_rate"
    t.string "service_type"
    t.string "pick_up_address"
    t.string "destination_address"
    t.float "number_hours_at_disposal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["beneficiary_id"], name: "index_services_on_beneficiary_id"
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
    t.bigint "beneficiary_id"
    t.string "first_name"
    t.string "last_name"
    t.string "agency"
    t.string "agency_address"
    t.index ["beneficiary_id"], name: "index_users_on_beneficiary_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "companies"
  add_foreign_key "services", "beneficiaries"
  add_foreign_key "services", "cars"
  add_foreign_key "services", "users"
  add_foreign_key "users", "beneficiaries"
end

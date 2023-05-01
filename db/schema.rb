# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_23_161225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "personal_information", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "client_subscriptions", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "subscription_id"
    t.datetime "started_at", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_subscriptions_on_client_id"
    t.index ["subscription_id"], name: "index_client_subscriptions_on_subscription_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.date "date_of_birth"
    t.decimal "balance", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "scooter_in_work_id"
    t.bigint "client_id"
    t.datetime "started_at", null: false
    t.datetime "ended_at", null: false
    t.decimal "total_sum"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["scooter_in_work_id"], name: "index_orders_on_scooter_in_work_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "order_id"
    t.integer "rate", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reviews_on_order_id"
  end

  create_table "scooter_in_works", force: :cascade do |t|
    t.bigint "scooter_id"
    t.bigint "city_id"
    t.float "battery_capacity", null: false
    t.float "current_battery", null: false
    t.string "current_location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_scooter_in_works_on_city_id"
    t.index ["scooter_id"], name: "index_scooter_in_works_on_scooter_id"
  end

  create_table "scooters", force: :cascade do |t|
    t.string "model", null: false
    t.float "range", null: false
    t.float "weight", null: false
    t.float "max_speed", null: false
    t.float "power", null: false
    t.float "price_per_minute", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name", null: false
    t.integer "duration", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "order_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_transactions_on_order_id"
  end

end

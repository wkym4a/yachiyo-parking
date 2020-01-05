# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_05_100448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parkings", force: :cascade do |t|
    t.string "symbol", limit: 2, null: false
    t.string "name", limit: 40, null: false
    t.string "address", limit: 255, null: false
    t.float "lat", null: false
    t.float "lon", null: false
    t.integer "price", null: false
    t.string "memo", limit: 400, null: false
    t.text "managing_memo", null: false
    t.integer "number", null: false
    t.integer "empty_number", null: false
    t.integer "status", limit: 2, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_parkings_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "cd"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin_flg"
    t.string "name", limit: 40, default: "", null: false
    t.string "address", limit: 255, default: "", null: false
    t.float "lat", default: 35.69962509328988, null: false
    t.float "lon", default: 140.08954485427356, null: false
    t.string "url", limit: 4096, default: "", null: false
    t.string "tel", limit: 20, default: "", null: false
    t.string "fax", limit: 20, default: "", null: false
    t.text "memo", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parkings", "users"
end

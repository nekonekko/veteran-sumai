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

ActiveRecord::Schema[7.0].define(version: 2023_08_22_065442) do
  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "companies_id", null: false
    t.integer "ieul_branch_id", null: false
    t.string "logo_url", null: false
    t.string "postal_code"
    t.bigint "prefectures_id", null: false
    t.bigint "cities_id", null: false
    t.string "address", null: false
    t.string "phone_number"
    t.string "fax_number"
    t.string "business_hours"
    t.string "holiday"
    t.text "catch_copy", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cities_id"], name: "index_branches_on_cities_id"
    t.index ["companies_id"], name: "index_branches_on_companies_id"
    t.index ["prefectures_id"], name: "index_branches_on_prefectures_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "prefecture_id", null: false
    t.string "name", null: false
    t.string "yomi", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "ieul_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branches", "cities", column: "cities_id"
  add_foreign_key "branches", "companies", column: "companies_id"
  add_foreign_key "branches", "prefectures", column: "prefectures_id"
  add_foreign_key "cities", "prefectures"
end

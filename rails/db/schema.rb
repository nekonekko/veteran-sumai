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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_08_23_042502) do
  create_table "assess_areas", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "office_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_assess_areas_on_city_id"
    t.index ["office_id"], name: "index_assess_areas_on_office_id"
=======
ActiveRecord::Schema[7.0].define(version: 2023_08_23_023037) do
  create_table "assessment_requests", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "office_id", null: false
    t.bigint "city_id", null: false
    t.string "property_address", null: false
    t.integer "property_type", null: false
    t.float "property_exclusive_area", null: false
    t.float "property_land_area", null: false
    t.float "property_building_area", null: false
    t.integer "property_building_area_unit", null: false
    t.float "property_floor_area", null: false
    t.string "url_param", null: false
    t.integer "property_room_plan", null: false
    t.integer "property_constructed_year", null: false
    t.string "user_email", null: false
    t.string "user_name", null: false
    t.string "user_name_kana", null: false
    t.string "user_tel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_assessment_requests_on_city_id"
    t.index ["office_id"], name: "index_assessment_requests_on_office_id"
>>>>>>> 8152dfc (migrationを実行した。)
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
    t.index ["ieul_company_id"], name: "index_companies_on_ieul_company_id", unique: true
  end

  create_table "offices", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id", null: false
    t.integer "ieul_office_id", null: false
    t.string "logo_url", null: false
    t.string "postal_code"
    t.bigint "prefecture_id", null: false
    t.bigint "city_id", null: false
    t.string "address", null: false
    t.string "phone_number"
    t.string "fax_number"
    t.string "business_hours"
    t.string "holiday"
    t.text "catch_copy", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_offices_on_city_id"
    t.index ["company_id"], name: "index_offices_on_company_id"
    t.index ["ieul_office_id"], name: "index_offices_on_ieul_office_id", unique: true
    t.index ["prefecture_id"], name: "index_offices_on_prefecture_id"
  end

  create_table "prefectures", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "office_id", null: false, comment: "企業ID"
    t.integer "ieul_office_id", null: false, comment: "ieul_店舗ID"
    t.string "username", null: false, comment: "名前"
    t.integer "gender", null: false, comment: "性別"
    t.integer "age", null: false, comment: "年齢"
    t.bigint "city_id", null: false, comment: "市区町村"
    t.string "property_address", null: false, comment: "住所"
    t.integer "property_type", null: false, comment: "物件種別"
    t.integer "sale_count", null: false, comment: "売却回数"
    t.date "considered_sale_on", null: false, comment: "売却検討時期"
    t.date "assessment_requested_on", null: false, comment: "売却依頼時期"
    t.date "started_selling_on", null: false, comment: "売出時期"
    t.date "sold_on", null: false, comment: "売却時期"
    t.date "transfered_on", null: false, comment: "引渡時期"
    t.integer "sale_speed_evaluation", null: false, comment: "売却スピードの満足度"
    t.integer "assessed_price", null: false, comment: "査定価格"
    t.integer "sale_price", null: false, comment: "売却価格"
    t.boolean "price_reduced", default: false, null: false, comment: "値下げしたかどうか"
    t.integer "price_reduction_how_many_month", comment: "売り出して何ヶ月に値下げしたか"
    t.integer "reduced_price", comment: "値下げ価格"
    t.integer "contract_price", null: false, comment: "成約価格"
    t.integer "sale_price_evaluation", null: false, comment: "売却価格の満足度"
    t.integer "mediation_contract_form", null: false, comment: "媒体契約の形態"
    t.text "headline", null: false, comment: "見出し"
    t.integer "sale_reason", null: false, comment: "売却価格"
    t.text "sale_anxiety_reason", null: false, comment: "売却時に不安だったこと"
    t.text "choose_agent_reaseon", null: false, comment: "この会社に決めた理由"
    t.integer "company_response_evaluation", null: false, comment: "不動産会社の対応満足度"
    t.text "company_response_evaluation_reason", null: false, comment: "不動産会社の対応満足度の理由"
    t.text "advice", null: false, comment: "今後売却する人へのアドバイス"
    t.text "improvement_point", comment: "不動産会社に改善して欲しいこと"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "property_city_id"
    t.index ["office_id"], name: "index_reviews_on_office_id"
  end

  add_foreign_key "assess_areas", "cities"
  add_foreign_key "assess_areas", "offices"
  add_foreign_key "cities", "prefectures"
  add_foreign_key "offices", "cities"
  add_foreign_key "offices", "companies"
  add_foreign_key "offices", "prefectures"
  add_foreign_key "reviews", "cities"
  add_foreign_key "reviews", "offices"
end

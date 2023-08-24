class AssessmentRequest < ActiveRecord
    # 空チェック
    validates :property_address, :property_type, :property_exclusive_area, :property_land_area, :property_building_area, :property_building_area_unit, :property_floor_area, :url_param, :property_room_plan, :property_constructed_year, :user_email, :user_name, :user_name_kana, :user_tel, presence :true
    # メールアドレス、電話番号のバリデーション
    validates :user_email, length: {maximum: 100}, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/  },
    validates :user_tel, length: {minimum: 10, maximum: 11}, format: {with: /\A0/}
end
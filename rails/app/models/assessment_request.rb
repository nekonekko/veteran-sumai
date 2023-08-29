# frozen_string_literal: true

class AssessmentRequest < ApplicationRecord
  belongs_to :office
  belongs_to :city

  # 空チェック
  validates :property_address, :property_type, :property_exclusive_area, :property_land_area,
            :property_building_area, :url_param,
            :property_room_plan, :property_constructed_year, :user_email, :user_name, :user_name_kana,
            :user_tel, presence: true
  # メールアドレス、電話番号のバリデーション
  validates :user_email, length: { maximum: 100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :user_tel, format: { with: /(\A0\d{9}\z)|(\A0\d{10}\z)/ }
end

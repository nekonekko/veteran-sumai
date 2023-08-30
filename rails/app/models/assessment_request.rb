# frozen_string_literal: true

require 'net/https'
require 'uri'
require 'json'

class AssessmentRequest < ApplicationRecord
  belongs_to :office
  belongs_to :city

  # 空チェック
  validates :property_address, :property_type, :property_exclusive_area, :property_land_area,
            :property_building_area,
            :property_room_plan, :property_constructed_year, :user_email, :user_name, :user_name_kana,
            :user_tel, presence: true
  # メールアドレス、電話番号のバリデーション
  validates :user_email, length: { maximum: 100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :user_tel, format: { with: /(\A0\d{9}\z)|(\A0\d{10}\z)/ }

  def post_to_ieul!
    uri = URI.parse('https://miniul-api.herokuapp.com/affiliate/v2/conversions')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?

    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(form_params)

    response = http.start do
      http.request(req)
    end

    update!(success: response.is_a?(Net::HTTPOK))
  end

  def form_params
    {
      branch_id: office.ieul_office_id,
      property_city: city_id,
      property_address: property_address,
      property_type: property_type,
      property_exclusive_area: property_exclusive_area,
      property_land_area: property_land_area,
      property_building_area: property_building_area,
      url_param: 'beteran-sumai',
      property_room_plan: property_room_plan,
      property_constructed_year: property_constructed_year,
      user_email: user_email,
      user_name: user_name,
      user_name_kana: user_name_kana,
      user_tel: user_tel
    }
  end
end

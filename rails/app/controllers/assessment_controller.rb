# frozen_string_literal: true

class AssessmentController < ApplicationController
  require 'net/https'
  require 'uri'
  require 'json'
  def show
    if params[:office_id].nil?
      redirect_to root_path

    else
      @office_id = params[:office_id]
      assessment_areas = Office.find(@office_id).assessment_areas
      @available_cities = []
      assessment_areas.each do |area|
        city_id = area.city.id
        city_name = area.city.name
        city_hash = { id: city_id, name: city_name }
        @available_cities.push(city_hash)
      end
    end
  end

  def new
    @assessment_request = AssessmentRequest.new
  end

  def create
    uri = URI.parse("https://miniul-api.herokuapp.com/affiliate/v2/conversions")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    http.start do
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data(
        {
          "branch_id": Office.find(params[:office_id]).id,
          "property_city": eval(params[:city])[:id],
          "property_address": params[:property_address],
          "property_type": params[:property_address].to_i,
          "property_exclusive_area": params[:property_exclusive_area].to_f,
          "property_land_area": params[:property_land_area].to_f,
          "property_building_area": params[:property_building_area].to_f,
          "url_param": 'beteran-sumai',
          "property_room_plan": params[:room_type].to_i,
          "property_constructed_year": params[:property_constructed_year].to_i,
          "user_email": params[:user_email],
          "user_name":  params[:custom_name_sei]+params[:custom_name_mei],
          "user_name_kana": params[:custom_kana_sei]+params[:custom_kana_mei],
          "user_tel": params[:user_tel]
        }
      )
      if http.request(req).code == "200"
        assessment_request = AssessmentRequest.new(
          office: Office.find(params[:office_id]),
          city_id: eval(params[:city])[:id].to_i,
          property_address: params[:property_address],
          property_type: params[:property_address].to_i,
          property_exclusive_area: params[:property_exclusive_area].to_f,
          property_land_area: params[:property_land_area].to_f,
          property_building_area: params[:property_building_area].to_f,
          url_param: 'beteran-sumai',
          property_room_plan: params[:room_type].to_i,
          property_constructed_year: params[:property_constructed_year].to_i,
          user_email: params[:user_email],
          user_name: params[:custom_name_sei]+params[:custom_name_mei],
          user_name_kana: params[:custom_kana_sei]+params[:custom_kana_mei],
          user_tel: params[:user_tel]
        )
        assessment_request.save
        redirect_to thanks_url
      else
        assessment_request = AssessmentRequest.new(
          office: Office.find(params[:office_id]),
          city_id: eval(params[:city])[:id].to_i,
          property_address: params[:property_address],
          property_type: params[:property_address].to_i,
          property_exclusive_area: params[:property_exclusive_area].to_f,
          property_land_area: params[:property_land_area].to_f,
          property_building_area: params[:property_building_area].to_f,
          url_param: 'beteran-sumai',
          property_room_plan: params[:room_type].to_i,
          property_constructed_year: params[:property_constructed_year].to_i,
          user_email: params[:user_email],
          user_name: params[:custom_name_sei]+params[:custom_name_mei],
          user_name_kana: params[:custom_kana_sei]+params[:custom_kana_mei],
          user_tel: params[:user_tel]
        )
        assessment_request.save
        redirect_to error_url
      end
    end
  end

  def thanks
  end

  def error
  end
end

# frozen_string_literal: true

class AssessmentController < ApplicationController
  def show
    if params[:office_id].nil?
      redirect_to root_path

    else
      office_id = params[:office_id]
      assessment_areas = Office.find(office_id).assessment_areas
      @available_cities = []
      assessment_areas.each do |area|
        city_id = area.city.id
        city_name = area.city.name
        city_hash = { id: city_id, name: city_name }
        @available_cities.push(city_hash)
      end
    end
  end

  def create
    assessment_request_params = {
      office: params[:office_id],
      city: params[:city],
      property_address: params[:property_address],
      property_type: params[:property_type],
      property_exclusive_area: params[:property_exclusive_area],
      property_land_area: params[:property_land_area],
      property_building_area: params[:property_building_area],
      url_param: 'beteran-sumai',
      property_room_plan: params[:property_room_plan],
      property_constructed_year: params[:property_constructed_year],
      user_email: params[:user_email],
      user_name: params[:custom_name_sei] + ' ' + params[:custom_name_mei],
      user_name_kana: params[:custom_kana_sei]+ ' ' + params[:custom_kana_mei],
      user_tel: params[:user_tel]
    }
    @assessment_request = AssessmentRequest.new(assessment_request_params)
  end

  private
    def assessment_requests_params
      params.require(:assessment_request).permit(:custom_name_sei, :custom_name_mei, :custom_kana_sei, :custom_kana_mei, :user_tel, :user_email, :city, :property_address, :property_type, :property_exclusive_area, :property_land_area, :property_building_area, :property_room_plan, :property_constructed_year )
    end
end

# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    # puts 'new params office_id: ' + params[:office_id]
    if params[:office_id].nil?
      #redirect_to root_path

    else
      @office_id = params[:office_id]
      # assessment_areas = Office.find(office_id).assessment_areas
      # @available_cities = []
      # assessment_areas.each do |area|
      #   city_id = area.city.id
      #   city_name = area.city.name
      #   city_hash = { id: city_id, name: city_name }
      #   @available_cities.push(city_hash)
      # end
    end
  end

  def create
    puts params[:office_id]
    puts 'x'  * 100
    assessment_request_params = {
      office_id: params[:office_id],
      city_id: params[:city_id],
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

    @error_messages = []
    if @assessment_request.valid?
      puts 'a'  * 100
      # 保存を行う
    else
      puts 'b' * 100
      # エラーメッセージの表示
      puts @assessment_request.errors.full_messages
      flash[:alert] = @assessment_request.errors.full_messages
      redirect_to action: :new
    end
  end

  private
    def assessment_requests_params
      params.require(:assessment_request).permit(:custom_name_sei, :custom_name_mei, :custom_kana_sei, :custom_kana_mei, :user_tel, :user_email, :city_id, :property_address, :property_type, :property_exclusive_area, :property_land_area, :property_building_area, :property_room_plan, :property_constructed_year )
    end
end

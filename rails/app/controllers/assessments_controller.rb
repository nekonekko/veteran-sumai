# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    Rails.logger.debug params[:office_id]
    if params[:office_id].nil?
      redirect_to root_url
      return
    end

    @assessment_request = AssessmentRequest.new(office_id: params[:office_id])
    @office = Office.find(params[:office_id])
  end

  def create
    puts **assessment_request_params
    Rails.logger.debug assessment_request_params
    assessment_request = AssessmentRequest.new(assessment_request_params)
    Rails.logger.debug params[:office_id]
    if assessment_request.valid?
        assessment_request.save!
        assessment_request.post_to_ieul!
        puts assessment_request.success
        redirect_to assessment_request.success? ? thanks_url : error_url
    else
      flash[:alert] = assessment_request.errors.full_messages
      redirect_to new_assessment_url(office_id: assessment_request.office_id)
    end
  end

  private

  def assessment_request_params
    params.require(:assessment_request)
          .permit(
            :office_id,
            :user_name,
            :user_name_kana,
            :user_tel,
            :user_email,
            :city_id,
            :property_address,
            :property_type,
            :property_exclusive_area,
            :property_land_area,
            :property_building_area,
            :property_room_plan,
            :property_constructed_year
          )
  end

  def build_form_data(params)
    office = Office.find(params[:office_id])
    {
      "branch_id": Office.find(params[:office_id]).id,
      "property_city": eval(params[:city])[:id].to_i,
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
  end

  def build_assessment_request(params, success)
    AssessmentRequest.new(
      office: Office.find(params[:office_id]),
      city_id: eval(params[:city])[:id].to_i,
      property_address: params[:property_address],
      property_type: params[:property_address].to_i,
      property_exclusive_area: params[:property_exclusive_area].to_f,
      property_land_area: params[:property_land_area].to_f,
      property_building_area: params[:property_building_area].to_f,
      property_room_plan: params[:room_type].to_i,
      property_constructed_year: params[:property_constructed_year].to_i,
      user_email: params[:user_email],
      user_name: params[:custom_name_sei]+params[:custom_name_mei],
      user_name_kana: params[:custom_kana_sei]+params[:custom_kana_mei],
      user_tel: params[:user_tel],
      api_failure: !success
    )
  end

  def thanks
  end

  def error
  end
end

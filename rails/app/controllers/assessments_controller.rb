# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    puts params[:office_id]
    if params[:office_id].nil?
      redirect_to root_url
      return
    end

    @assessment_request = AssessmentRequest.new(office_id: params[:office_id])
  end

  def create
    puts assessment_request_params
    assessment_request = AssessmentRequest.new(**assessment_request_params)
    puts params[:office_id]
    if assessment_request.valid?
      assessment_request.save!
      # redirect_to thank_page_path
    else
      flash[:alert] = assessment_request.errors.full_messages
      redirect_to new_assessment_url(office_id: assessment_request.office_id)
      # redirect_to action: :create
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
                  :property_constructed_year)
  end
end

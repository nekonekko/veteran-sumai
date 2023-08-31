# frozen_string_literal: true

class AssessmentsController < ApplicationController
  def new
    Rails.logger.debug params[:office_id]
    if params[:office_id].nil?
      redirect_to root_url
      return
    end

    @assessment_request = AssessmentRequest.new(office_id: params[:office_id])
    # @office = Office.find(params[:office_id])
    @office = @assessment_request.office
  end

  def create
    puts 'a' * 100
    @assessment_request = AssessmentRequest.new(assessment_request_params)
    if @assessment_request.valid?
      @assessment_request.save!
      @assessment_request.post_to_ieul!
      redirect_to @assessment_request.success? ? thanks_url : error_url
    else
      puts 'b' * 100
      puts @assessment_request.errors.full_messages
      flash.now[:alert] = @assessment_request.errors.full_messages
      #redirect_to new_assessment_url(office_id: @assessment_request.office_id)
      @office = @assessment_request.office
      puts @office.name
      puts @office.company.name
      
      render :new
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

  def thanks; end

  def error; end
end

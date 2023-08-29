# frozen_string_literal: true

class AssessmentController < ApplicationController
  def show
    if params[:office_id].nil?
      redirect_to "/"

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

  def new
    @assessment_request = AssessmentRequest.new
  end
end

# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])

    @offices = []
    AssessmentArea.where(city: @city).each do |assesment_area|
      @offices.push(assesment_area.office)
    end
  end
end

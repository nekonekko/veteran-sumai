# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    @city = City.find(params[:city_id])
    @prefecture = Prefecture.find(params[:prefecture_id])

    @cities = @prefecture.cities
  end
end

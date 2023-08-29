# frozen_string_literal: true

module CitiesHelper
  def prefecture_and_city_name(city)
    "#{city.prefecture.name} #{city.name}"
  end
end

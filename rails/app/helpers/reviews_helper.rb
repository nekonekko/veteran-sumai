# frozen_string_literal: true

module ReviewsHelper
  def review_address(review)
    "#{review.city.prefecture.name}/#{review.city.name}"
  end
end

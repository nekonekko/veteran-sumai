# frozen_string_literal: true

module ReviewsHelper
  def office_fullname(office)
    "#{office.company.name}/#{office.name}"
  end

  def office_fulladdress(office)
    office.prefecture.name + office.city.name + office.address
  end

  def review_address(review)
    "#{review.city.prefecture.name}/#{review.city.name}"
  end
end

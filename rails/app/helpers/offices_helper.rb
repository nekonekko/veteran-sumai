# frozen_string_literal: true

module OfficesHelper
  def company_and_office_name(office)
    Rails.logger.debug office
    "#{office.company.name} #{office.name}"
  end

  def office_fulladdress(office)
    office.prefecture.name + office.city.name + office.address
  end
end

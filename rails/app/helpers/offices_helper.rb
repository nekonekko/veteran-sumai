# frozen_string_literal: true

module OfficesHelper
  def company_and_office_name(office)
    "#{office.company.name} #{office.name}"
  end
end

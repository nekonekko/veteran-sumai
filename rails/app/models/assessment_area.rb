# frozen_string_literal: true

class AssessmentArea < ApplicationRecord
  belongs_to :office
  belongs_to :city

  validates :office_id, uniqueness: { scope: :city_id }
end

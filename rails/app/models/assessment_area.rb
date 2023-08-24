# frozen_string_literal: true

class AssessmentArea < ApplicationRecord
    belongs_to :office
    belongs_to :city
  end
  
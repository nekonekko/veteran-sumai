# frozen_string_literal: true

class Office < ApplicationRecord
  belongs_to :company
  belongs_to :prefecture
  belongs_to :city
  has_many :assessment_areas, dependent: :destroy

  validates :ieul_office_id, presence: true, uniqueness: true
  validates :logo_url, presence: true
  validates :address, presence: true
  validates :catch_copy, presence: true
  validates :introduction, presence: true
end

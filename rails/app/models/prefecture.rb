# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities, dependent: :destroy
  
  validates :name, presence: true
end

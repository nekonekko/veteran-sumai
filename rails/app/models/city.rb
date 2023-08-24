# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture

  validates :name, presence: true
  validates :yomi, presence: true
end

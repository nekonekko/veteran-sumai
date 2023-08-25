# frozen_string_literal: true

class SaleCount < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews, dependent: :destroy

  self.data = [
    { id: 0, name: '初めて' },
    { id: 1, name: '2回目' },
    { id: 2, name: '3回以上' }
  ]
end

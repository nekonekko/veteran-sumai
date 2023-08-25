# frozen_string_literal: true

class SaleCount < ActiveHash::Base
  self.data = [
    { id: 1, name: '初めて' },
    { id: 2, name: '2回目' },
    { id: 3, name: '3回以上' }
  ]
end

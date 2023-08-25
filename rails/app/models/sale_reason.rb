# frozen_string_literal: true

class SaleReason < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews, dependent: :destroy

  self.data = [
    { id: 1, name: '住み替え' },
    { id: 2, name: '相続' },
    { id: 3, name: '転職' },
    { id: 4, name: '離婚' },
    { id: 5, name: '資産整理' },
    { id: 6, name: '金銭的な理由' },
    { id: 99, name: 'その他' }
  ]
end

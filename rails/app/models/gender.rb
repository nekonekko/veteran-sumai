# frozen_string_literal: true

class Gender < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews, dependent: :destroy

  self.data = [
    { id: 0, name: '男性' },
    { id: 1, name: '女性' },
    { id: 2, name: 'その他・不明' }
  ]
end

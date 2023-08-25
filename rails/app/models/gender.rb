# frozen_string_literal: true

class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '男性' },
    { id: 2, name: '女性' },
    { id: 3, name: 'その他・不明' }
  ]
end

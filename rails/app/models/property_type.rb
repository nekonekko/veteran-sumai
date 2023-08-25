# frozen_string_literal: true

class PropertyType < ActiveHash::Base
  self.data = [
    { id: 1, name: 'マンション' },
    { id: 2, name: '戸建て' },
    { id: 3, name: '土地' }
  ]
end

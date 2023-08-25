class PropertyType < ActiveHash::Base
    include ActiveHash::Associations
    has_many :reviews
    
    self.data = [
        {:id => 0, :name => 'マンション'},
        {:id => 1, :name => '戸建て'},
        {:id => 2, :name => '土地'}
    ]
end
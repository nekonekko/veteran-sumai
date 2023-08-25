class Gender < ActiveHash::Base
    include ActiveHash::Associations
    has_many :reviews
    
    self.data = [
        {:id => 0, :name => '男性'},
        {:id => 1, :name => '女性'},
        {:id => 2, :name => 'その他・不明'}
    ]
end
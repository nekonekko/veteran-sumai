class MediationContractForm < ActiveHash::Base
    include ActiveHash::Associations
    has_many :reviews

    self.data = [
        {:id => 1, :name =>'専属専任媒介契約'},
        {:id => 2, :name =>'専任媒介契約'},
        {:id => 3, :name =>'一般媒介契約'},
        {:id => 4, :name =>'わからない'}
    ]
end
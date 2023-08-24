FactoryBot.define do
    factory :city do
        association :prefecture
        name {"XX"}
        yomi {"YY"}
    end
  end
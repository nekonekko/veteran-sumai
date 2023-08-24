# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    prefecture
    name { '札幌市' }
    yomi { 'さっぽろ' }
  end
end

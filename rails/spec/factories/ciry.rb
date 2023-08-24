# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    prefecture
    name { 'XX' }
    yomi { 'YY' }
  end
end

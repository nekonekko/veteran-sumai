# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :office
  belongs_to :city

  validates :ieul_office_id, presence: true
  validates :username, :gender, :age, :property_address, :property_type, :sale_count,
            :considered_sale_on, :assessment_requested_on, :started_selling_on, :sold_on,
            :transfered_on, :sale_speed_evaluation, :assessed_price, :sale_price,
            :contract_price, :sale_price_evaluation, :mediation_contract_form, :headline,
            :sale_reason, :sale_anxiety_reason, :choose_agent_reaseon, :company_response_evaluation,
            :company_response_evaluation_reason, :advice, presence: true

  validates :price_reduced, inclusion: { in: [true, false] }

  validates :age, :assessed_price, :sale_price, :contract_price,
            numericality: { only_integer: true }
  validates :price_reduction_how_many_month, :reduced_price,
            numericality: { only_integer: true, allow_nil: true }
  validates :sale_speed_evaluation, :company_response_evaluation, :sale_price_evaluation,
            numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 },
            allow_nil: true

  enum sale_count: { '初めて' => 0, '2回目' => 1, '3回以上' => 3 }
  enum sale_reason: { '住み替え' => 0, '相続' => 1, '転職' => 2, '離婚' => 3, '資産整理' => 4, '金銭的な理由' => 5, 'その他' => 6 }
  enum property_type: { 'マンション' => 0, '戸建て' => 1, '土地' => 2 }
  enum gender: { '男性' => 0, '女性' => 1, 'その他・不明' => 2 }
end

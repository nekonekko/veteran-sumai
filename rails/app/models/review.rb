# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :office
  belongs_to :city
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sale_count

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
end

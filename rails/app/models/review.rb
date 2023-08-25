# frozen_string_literal: true

class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :office
  belongs_to :city
  belongs_to_active_hash :sale_count
  belongs_to_active_hash :gender
  belongs_to_active_hash :sale_reason
  belongs_to_active_hash :property_type
  belongs_to_active_hash :mediation_contract_form

  validates :ieul_office_id, :username, :gender, :age,
            :property_address, :property_type, :sale_count,
            :considered_sale_on, :assessment_requested_on, :started_selling_on, :sold_on,
            :transfered_on, :mediation_contract_form, :headline,
            :sale_reason, :sale_anxiety_reason, :choose_agent_reaseon,
            :company_response_evaluation_reason, :advice, presence: true

  validates :price_reduced, inclusion: { in: [true, false] }

  validates :sale_count_id, inclusion: { in: SaleCount.ids }

  validates :gender_id, inclusion: { in: Gender.ids }

  validates :sale_reason_id, inclusion: { in: SaleReason.ids }

  validates :property_type_id, inclusion: { in: PropertyType.ids }

  validates :mediation_contract_form_id, inclusion: { in: MediationContractForm.ids }

  validates :age, :assessed_price, :sale_price, :contract_price,
            numericality: { only_integer: true }

  validates :price_reduction_how_many_month, :reduced_price,
            numericality: { only_integer: true, allow_nil: true }

  validates :sale_speed_evaluation, :company_response_evaluation, :sale_price_evaluation,
            numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end

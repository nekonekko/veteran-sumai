# frozen_string_literal: true

class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :office, null: false, foreign_key: true
      t.integer :ieul_office_id, null: false, uniqueness: true
      t.string :username, null: false
      t.integer :gender, null: false
      t.integer :age, null: false
      t.references :city, index: { name: "property_city_id" }, null: false, foreign_key: true
      t.string :property_address, null: false
      t.integer :property_type, null: false
      t.integer :num_of_sales, null: false
      t.date :considered_sale_on, null: false
      t.date :requested_assessment_on, null: false
      t.date :started_selling_on, null: false
      t.date :sold_on, null: false
      t.date :transfered_on, null: false
      t.integer :satisfaction_with_sale_speed, null: false
      t.integer :assessed_price, null: false
      t.integer :sale_price, null: false
      t.boolean :is_price_reduced, null: false
      t.integer :price_reduction_after_how_many_month, null: true
      t.integer :reduced_price, null: true
      t.integer :contract_price, null: false
      t.integer :satisfaction_with_sale_price, null: false
      t.integer :form_of_mediation_contract, null: false
      t.text :headline, null: false
      t.integer :reason_for_sale, null: false
      t.text :concerns_at_time_of_sale, null: false
      t.text :reason_for_choosing_this_agent, null: false
      t.integer :satisfaction_with_company_response, null: false
      t.text :reason_for_satisfaction_with_company_response, null: false
      t.text :advice_for_future_sellers, null: false
      t.text :improvement_desired_from_company, null: true
      t.timestamps
    end
  end
end

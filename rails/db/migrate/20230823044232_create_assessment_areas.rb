# frozen_string_literal: true

class CreateAssessmentAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_areas do |t|
      t.references :office, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
    add_index :assessment_areas, [:office_id, :city_id], unique: true
  end
end

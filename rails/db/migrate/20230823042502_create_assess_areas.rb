# frozen_string_literal: true

class CreateAssessAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :assess_areas do |t|
      t.references :office, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end

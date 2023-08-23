class CreateAssessArea < ActiveRecord::Migration[7.0]
  def change
    create_table :assess_areas do |t|
      t.references :offices, null: false, foreign_key: true
      t.references :cities, null: false, foreign_key: true
      t.timestamps
    end
  end
end

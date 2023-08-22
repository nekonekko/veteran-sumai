class CreateAssessArea < ActiveRecord::Migration[7.0]
  def change
    create_table :assess_areas do |t|
      t.references :branch, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end

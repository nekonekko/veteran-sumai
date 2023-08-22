class Branches < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :ieul_company_id, null: false, unique: true
      t.timestamps
    end
  end
end

class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.references :companies, null: false, foreign_key: true
      t.integer :ieul_branch_id, null: false
      t.string :logo_url, null: false
      t.string :postal_code
      t.references :prefectures, null: false, foreign_key: true
      t.references :cities, null: false, foreign_key: true
      t.string :address, null: false
      t.string :phone_number
      t.string :fax_number
      t.string :business_hours
      t.string :holiday
      t.text :catch_copy, null: false
      t.text :introduction, null: false
      t.timestamps
    end
    add_index :branches, [:ieul_branch_id], unique: true
  end
end

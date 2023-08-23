# frozen_string_literal: true

class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :name, null: false
      t.references :company, null: false, foreign_key: true
      t.integer :ieul_office_id, null: false
      t.string :logo_url, null: false
      t.string :postal_code
      t.references :prefecture, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address, null: false
      t.string :phone_number
      t.string :fax_number
      t.string :business_hours
      t.string :holiday
      t.text :catch_copy, null: false
      t.text :introduction, null: false
      t.timestamps
    end
    add_index :offices, [:ieul_office_id], unique: true
  end
end

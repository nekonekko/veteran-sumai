# frozen_string_literal: true

class CreateSatei < ActiveRecord::Migration[7.0]
  def change
    create_table :sateis do |t|
      t.references :office, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :property_address, null: false
      t.integer :property_type, null: false
      t.float :property_exclusive_area, null: false
      t.float :property_land_area, null: false
      t.float :property_building_area, null: false
      t.integer :property_building_area_unit, null: false
      t.float :property_floor_area, null: false
      t.string :url_param, null: false
      t.integer :property_room_plan, null: false
      t.integer :property_constructed_year, null: false
      t.string :user_email, null: false
      t.string :user_name, null: false
      t.string :user_name_kana, null: false
      t.string :user_tel, null: false
      t.timestamps
    end
  end
end

class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.integer :id, null: false, primary_key: true
      t.string :name, limit: 50, null: false
      t.timestamps
    end
  end
end
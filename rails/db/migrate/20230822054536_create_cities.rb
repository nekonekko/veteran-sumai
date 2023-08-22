class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.integer :id, null: false, primary_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.string :name, limit: 50, null: false
      t.string :yomi, limit: 50, null: false
      t.timestamps
    end
  end
end
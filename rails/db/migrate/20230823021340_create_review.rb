# frozen_string_literal: true

class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :office, null: false, foreign_key: true, comment: '企業ID'
      t.integer :ieul_office_id, null: false, uniqueness: true, comment: 'ieul_店舗ID'
      t.string :username, null: false, comment: '名前'
      t.integer :gender_id, null: false, comment: '性別'
      t.integer :age, null: false, comment: '年齢'
      t.references :city, index: { name: 'property_city_id' }, null: false, foreign_key: true, comment: '市区町村'
      t.string :property_address, null: false, comment: '住所'
      t.integer :property_type_id, null: false, comment: '物件種別'
      t.integer :sale_count_id, null: false, comment: '売却回数'
      t.date :considered_sale_on, null: false, comment: '売却検討時期'
      t.date :assessment_requested_on, null: false, comment: '売却依頼時期'
      t.date :started_selling_on, null: false, comment: '売出時期'
      t.date :sold_on, null: false, comment: '売却時期'
      t.date :transfered_on, null: false, comment: '引渡時期'
      t.integer :sale_speed_evaluation, null: false, comment: '売却スピードの満足度'
      t.integer :assessed_price, null: false, comment: '査定価格'
      t.integer :sale_price, null: false, comment: '売却価格'
      t.boolean :price_reduced, null: false, default: false, comment: '値下げしたかどうか'
      t.integer :price_reduction_how_many_month, null: true, comment: '売り出して何ヶ月に値下げしたか'
      t.integer :reduced_price, null: true, comment: '値下げ価格'
      t.integer :contract_price, null: false, comment: '成約価格'
      t.integer :sale_price_evaluation, null: false, comment: '売却価格の満足度'
      t.integer :mediation_contract_form_id, null: false, comment: '媒体契約の形態'
      t.text :headline, null: false, comment: '見出し'
      t.integer :sale_reason_id, null: false, comment: '売却理由'
      t.text :sale_anxiety_reason, null: false, comment: '売却時に不安だったこと'
      t.text :choose_agent_reaseon, null: false, comment: 'この会社に決めた理由'
      t.integer :company_response_evaluation, null: false, comment: '不動産会社の対応満足度'
      t.text :company_response_evaluation_reason, null: false, comment: '不動産会社の対応満足度の理由'
      t.text :advice, null: false, comment: '今後売却する人へのアドバイス'
      t.text :improvement_point, null: true, comment: '不動産会社に改善して欲しいこと'
      t.timestamps
    end
  end
end

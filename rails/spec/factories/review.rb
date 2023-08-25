# frozen_string_literal: true

FactoryBot.define do
    factory :review do
        office
        ieul_office_id { 1 }
        username { "服部 彩" }
        gender_id { 1 }
        age { 46 }
        city
        property_address { "品川2丁目" }
        property_type_id { 0 }
        sale_count_id { 0 }
        considered_sale_on { 2018-02-14 }
        assessment_requested_on { 2018-02-14 }
        started_selling_on { 2018-02-14 }
        sold_on { 2018-02-14 }
        transfered_on { 2018-02-14 }
        sale_speed_evaluation { 4 }
        assessed_price { 22000000 }
        sale_price { 22500000 }
        price_reduced { false }
        price_reduction_how_many_month { 3 }
        reduced_price { 500000 }
        contract_price { 17000000 }
        sale_price_evaluation { 2 }
        mediation_contract_form_id { 2 }
        headline { "港区：担当者の対応が良かったです。 " }
        sale_reason_id { 5 }
        sale_anxiety_reason {
         "港区品川：山路（やまみち）を登りながら、こう考えた。知に働けば角が立つ。情に棹させば流される。意地を通せば窮屈だ。とかくに人の世は住みにくい。\r\n住みにくさが高じると、安いところへ引き越したくなる。どこへ越しても住みにくいと悟った時、詩が生まれて、画ができる。"
        }
        choose_agent_reaseon {
         "港区品川：吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事 \r\nだけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれ"
        }
        company_response_evaluation { 5 }
        company_response_evaluation_reason { 0 }
        advice { "港区品川：木曾路はすべて山の中である。\r\nあるところは岨づたいに" }
        improvement_point { '売却方法の選択肢をアドバイスして欲しい。' }
    end
  end
  
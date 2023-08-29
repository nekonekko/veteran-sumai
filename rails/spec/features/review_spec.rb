# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/show' do
  let!(:prefecture) do
    create(
      :prefecture,
      name: '北海道'
    )
  end
  let!(:city) do
    create(
      :city,
      name: '札幌市',
      yomi: 'さっぽろ'
    )
  end
  let!(:company) do
    create(
      :company,
      name: 'Speee不動産',
      ieul_company_id: 1
    )
  end
  let!(:office) do
    create(
      :office,
      name: '赤坂店',
      company: company,
      ieul_office_id: 1,
      logo_url: 'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg',
      postal_code: '329-1224',
      prefecture: prefecture,
      city: city,
      address: '品川2丁目',
      phone_number: '03-0000-0000',
      fax_number: '03-0000-0000',
      business_hours: '平日9:00～18:00',
      holiday: '水曜日、祝日、GW、他',
      catch_copy: '不動産の売却はSpeee1不動産にお任せください',
      introduction: 'Speee1不動産港区支店にお任せください東京都の不動産売却の実績多数です。'
    )
  end
  let!(:review) do
    create(
      :review,
      office: office,
      sale_anxiety_reason: '港区品川：山路（やまみち）を登りながら、こう考えた'
    )
  end

  it 'correct reviewpage' do
    visit review_path(review)
    expect(page).to have_selector('h1', text: '港区：担当者の対応が良かったです。')
    expect(page).to have_content('売却した不動産会社名：Speee不動産 赤坂店')
    expect(page).to have_content('港区品川：山路（やまみち）を登りながら、こう考えた')
  end
end

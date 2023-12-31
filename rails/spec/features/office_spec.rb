# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'offices/show' do
  let!(:company) { create(:company, name: 'SPeee不動産') }
  let!(:office) do
    create(:office,
           company: company,
           name: '赤坂店',
           catch_copy: '不動産の売却はSpeee1不動産にお任せください')
  end
  let!(:sale_count) { SaleCount.create(id: 1) }
  let!(:sale_reason) { SaleReason.create(id: 1) }
  let!(:prefecture) { create(:prefecture, name: '北海道') }
  let!(:city) { create(:city, prefecture: prefecture, name: '札幌市') }

  before do
    create_list(:review,
                3,
                office: office,
                city: city,
                headline: '港区：担当者の対応が良かったです。',
                sale_count: sale_count,
                sale_reason: sale_reason,
                improvement_point: 'あいうえお')
  end

  it 'render correct office page' do
    visit office_path(office)
    expect(page).to have_title 'SPeee不動産 赤坂店 | ベテランすまい'
    expect(page).to have_link 'TOP'
    expect(page).to have_link '北海道 札幌市'
    expect(page).to have_selector('h1', text: 'SPeee不動産 赤坂店')
    expect(page).to have_selector('h2', text: '不動産の売却はSpeee1不動産にお任せください')
    expect(page).to have_selector('h2', text: 'SPeee不動産 赤坂店について')
    expect(page).to have_selector('h2', text: 'SPeee不動産 赤坂店で売却した人の口コミ')
    expect(page).to have_selector('h3', text: '港区：担当者の対応が良かったです。')
    expect(page.all('article.review-item').count).to eq 3
    expect(page).to have_link '査定依頼をする'
  end
end

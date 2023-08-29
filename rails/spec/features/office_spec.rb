# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'offices/show', type: :feature do
  let!(:company) { create(:company) }
  let!(:office) { create(:office, company: company) }
  let!(:sale_count) { SaleCount.create(id: 1) }
  let!(:sale_reason) { SaleReason.create(id: 1) }
  let!(:city) { create(:city) }

  before do
    create_list(:review, 3, office: office, city: city, sale_count: sale_count, sale_reason: sale_reason,
      improvement_point: 'あいうえお')
  end

  it 'render correct office info' do
    visit office_path(office)
    expect(page).to have_selector('h1', text: 'SPeee不動産 赤坂店')
    expect(page).to have_selector('h2', text: '不動産の売却はSpeee1不動産にお任せください')
  end

  context 'render correct review info' do
    it 'correct number of reviews' do
      visit office_path(office)
      # reviewの数 + 企業の総合評価の1個
      expect(page.all("span.stars").count).to eq 3 + 1
    end

    it 'correct review headline' do
      visit office_path(office)
      expect(page).to have_selector('h3', text: '港区：担当者の対応が良かったです。')
    end
  end
end

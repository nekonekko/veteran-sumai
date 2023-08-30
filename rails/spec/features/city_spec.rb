# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/show' do
  let!(:prefecture) { create(:prefecture, name: '北海道') }
  let!(:cities) { create_list(:city, 20, prefecture: prefecture, name: '札幌市') }
  let!(:company) { create(:company, name: 'SPeee不動産') }
  let!(:offices) { create_list(:office, 5, company: company, name: '赤坂店') }

  before do
    (1..5).each do |idx|
      AssessmentArea.create(
        office_id: offices[idx - 1].id,
        city_id: cities.first.id
      )
    end
  end

  it 'render correct city page' do
    visit prefecture_city_path(prefecture.id, cities.first.id)
    expect(page).to have_link 'TOP'
    expect(page).to have_selector('h1', text: '北海道 札幌市の不動産会社')
    expect(page).to have_selector('h2', text: '北海道全域')
    expect(page.all('article.office-item').count).to eq 5
    expect(page).to have_selector('h2', text: 'SPeee不動産 赤坂店')
    expect(page.all('li.address-item').count).to eq 20
    expect(page).to have_link '札幌市'
  end
end

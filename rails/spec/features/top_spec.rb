# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/show' do
  let!(:prefectures) { create_list(:prefecture, 47, name: '北海道') }

  before do
    create_list(:city, 10, prefecture: prefectures[0])
    create_list(:city, 20, prefecture: prefectures[1])
  end

  it 'render correct top page' do
    visit root_path
    expect(page.all('li.prefecture-item').count).to eq 47
    expect(page.all('article.prefecture-title').count).to eq 47
    expect(page.all('li.city-item').count).to eq 30
    expect(page).to have_selector('h1', text: 'ベテランすまい')
    expect(page).to have_selector('h2', text: '都道府県一覧')
    expect(page).to have_selector('h2', text: '北海道')
  end
end

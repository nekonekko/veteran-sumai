# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cities/show' do
  let!(:prefecture) { create(:prefecture) }

  before do
    @cities = create_list(:city, 20, prefecture: prefecture)
  end

  it 'render correct city page' do
    visit prefecture_city_path(prefecture.id, @cities.first.id)
    expect(page).to have_selector('h1', text: '北海道 札幌市の不動産会社')
    expect(page).to have_selector('h2', text: '北海道全域')
    expect(page.all('li.address-item').count).to eq 20
    expect(page).to have_link '札幌市'
  end
end

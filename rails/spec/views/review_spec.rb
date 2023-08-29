# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/show', type: :feature do
  let!(:office) { create(:office) }
  let!(:review) { create(:review, office: office) }

  it 'correct reviewpage headline' do
    visit review_path(review)
    expect(page).to have_selector('h1', text: '港区：担当者の対応が良かったです。')
  end

  it 'correct review to company_name ' do
    visit review_path(review)
    expect(page).to have_content("売却した不動産会社名：SPeee不動産/赤坂店")
  end

  it 'correct review sale_anxiety_reason' do
    visit review_path(review)
    expect(page).to have_content("港区品川：山路（やまみち）を登りながら、こう考えた")
  end
end

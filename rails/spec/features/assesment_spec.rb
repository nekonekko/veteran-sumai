# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessment/new' do

  it '査定依頼ページの入力、画面遷移' do
    visit new_assessment_path(office_id: 1)
    click_button '査定依頼をする'
    expect(page).to have_content('市区町村を入力してください')
    expect(page).to have_content('市区町村以下を入力してください')
    expect(page).to have_content('物件種別を入力してください')
    expect(page).to have_content('専有面積を入力してください')
    expect(page).to have_content('土地面積を入力してください')
    expect(page).to have_content('建物面積を入力してください')
    expect(page).to have_content('間取りを入力してください')
    expect(page).to have_content('築年数を入力してください')
    expect(page).to have_content('メールアドレスを入力してください')
    expect(page).to have_content('お名前を入力してください')
    expect(page).to have_content('電話番号を入力してください')
    expect(page).to have_content('メールアドレスは不正な値です')
    expect(page).to have_content('電話番号は不正な値です')
  end

  it '査定依頼ページにoffice_idが入力されていない場合' do
    visit new_assessment_path
    expect(current_path).to eq(root_path)
  end
end
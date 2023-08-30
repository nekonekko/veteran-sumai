# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessment/new' do
  let!(:company) { create(:company, name: 'SPeee不動産') }
  let!(:office) { create(:office, company: company, name: '赤坂店') }
  let!(:city) { create(:city, name: '港区') }

  it '査定依頼ページの入力、画面遷移（マンション）' do
    visit new_assessment_path(office_id: office.id)
    expect(page).to have_title '査定 | SPeee不動産 赤坂店 | ベテランすまい'
    click_button '査定依頼をする'
    expect(page).to have_content('市区町村を入力してください')
    expect(page).to have_content('市区町村以下を入力してください')
    expect(page).to have_content('物件種別を入力してください')
    expect(page).to have_content('間取りを入力してください')
    expect(page).to have_content('築年数を入力してください')
    expect(page).to have_content('メールアドレスを入力してください')
    expect(page).to have_content('お名前を入力してください')
    expect(page).to have_content('電話番号を入力してください')
    expect(page).to have_content('メールアドレスは不正な値です')
    expect(page).to have_content('電話番号は不正な値です')
    expect(page).to have_current_path(new_assessment_path, ignore_query: true)

    choose 'マンション'
    click_button '査定依頼をする'
    expect(page).to have_content('専有面積を入力してください')

    visit new_assessment_path(office_id: office.id)
    fill_in 'お名前', with: 'John Doe'
    fill_in 'フリガナ', with: 'ジョン ドウ'
    fill_in '電話番号', with: '08091829008'
    fill_in 'メールアドレス', with: 'john@example.com'
    select '港区', from: '市区町村'
    fill_in '市区町村以下', with: 'Some address'
    choose 'マンション'
    fill_in '専有面積', with: '100'
    fill_in '土地面積', with: '200'
    fill_in '建物面積', with: '300'
    select '1R', from: '間取り'
    fill_in '建築年', with: '1990'
    click_button '査定依頼をする'
    expect(page).to have_current_path(thanks_path, ignore_query: true)

  end

  it '査定依頼ページの入力、画面遷移（戸建て）' do
    visit new_assessment_path(office_id: office.id)
    expect(page).to have_title '査定 | SPeee不動産 赤坂店 | ベテランすまい'
    click_button '査定依頼をする'
    expect(page).to have_content('市区町村を入力してください')
    expect(page).to have_content('市区町村以下を入力してください')
    expect(page).to have_content('物件種別を入力してください')
    expect(page).to have_content('間取りを入力してください')
    expect(page).to have_content('築年数を入力してください')
    expect(page).to have_content('メールアドレスを入力してください')
    expect(page).to have_content('お名前を入力してください')
    expect(page).to have_content('電話番号を入力してください')
    expect(page).to have_content('メールアドレスは不正な値です')
    expect(page).to have_content('電話番号は不正な値です')

    choose '戸建て'
    click_button '査定依頼をする'
    expect(page).to have_content('土地面積を入力してください')
    expect(page).to have_content('建物面積を入力してください')
  end

  it '査定依頼ページの入力、画面遷移（土地）' do
    visit new_assessment_path(office_id: office.id)
    expect(page).to have_title '査定 | SPeee不動産 赤坂店 | ベテランすまい'
    click_button '査定依頼をする'
    expect(page).to have_content('市区町村を入力してください')
    expect(page).to have_content('市区町村以下を入力してください')
    expect(page).to have_content('物件種別を入力してください')
    expect(page).to have_content('間取りを入力してください')
    expect(page).to have_content('築年数を入力してください')
    expect(page).to have_content('メールアドレスを入力してください')
    expect(page).to have_content('お名前を入力してください')
    expect(page).to have_content('電話番号を入力してください')
    expect(page).to have_content('メールアドレスは不正な値です')
    expect(page).to have_content('電話番号は不正な値です')

    choose '土地'
    click_button '査定依頼をする'
    expect(page).to have_content('土地面積を入力してください')
  end

  it '査定依頼ページにoffice_idが入力されていない場合' do
    visit new_assessment_path
    expect(page).to have_current_path(root_path, ignore_query: true)
  end
end

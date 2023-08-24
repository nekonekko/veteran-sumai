# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssessmentRequest do
  describe '空白のバリデーションテスト' do
    it 'すべての情報が正しく入力されている時、有効であること' do
      ass = build(:assessment_request)
      expect(ass).to be_valid
    end

    it '物件の住所が空の場合、無効であること' do
      ass = build(:assessment_request, property_address: nil)
      expect(ass).not_to be_valid
    end

    it '物件の種別が空の場合、無効であること' do
      ass = build(:assessment_request, property_type: nil)
      expect(ass).not_to be_valid
    end

    it '物件の専有面積が空の場合、無効であること' do
      ass = build(:assessment_request, property_exclusive_area: nil)
      expect(ass).not_to be_valid
    end

    it '物件の土地面積が空の場合、無効であること' do
      ass = build(:assessment_request, property_land_area: nil)
      expect(ass).not_to be_valid
    end

    it '物件の建物面積が空の場合、無効であること' do
      ass = build(:assessment_request, property_building_area: nil)
      expect(ass).not_to be_valid
    end

    it '物件の建物面積の単位が空の場合、無効であること' do
      ass = build(:assessment_request, property_building_area_unit: nil)
      expect(ass).not_to be_valid
    end

    it '物件の階数が空の場合、無効であること' do
      ass = build(:assessment_request, property_floor_area: nil)
      expect(ass).not_to be_valid
    end

    it 'URLパラメータが空の場合、無効であること' do
      ass = build(:assessment_request, url_param: nil)
      expect(ass).not_to be_valid
    end

    it '部屋のプランが空の場合、無効であること' do
      ass = build(:assessment_request, property_room_plan: nil)
      expect(ass).not_to be_valid
    end

    it '築年数が空の場合、無効であること' do
      ass = build(:assessment_request, property_constructed_year: nil)
      expect(ass).not_to be_valid
    end

    it 'ユーザーのメールアドレスが空の場合、無効であること' do
      ass = build(:assessment_request, user_email: nil)
      expect(ass).not_to be_valid
    end

    it 'ユーザーの名前が空の場合、無効であること' do
      ass = build(:assessment_request, user_name: nil)
      expect(ass).not_to be_valid
    end

    it 'ユーザーの名前（カナ）が空の場合、無効であること' do
      ass = build(:assessment_request, user_name_kana: nil)
      expect(ass).not_to be_valid
    end

    it 'ユーザーの電話番号が空の場合、無効であること' do
      ass = build(:assessment_request, user_tel: nil)
      expect(ass).not_to be_valid
    end
  end

  describe 'フォーマットのバリデーションテスト' do
    it 'メールアドレスが正しい形式の場合、有効であること' do
      ass = build(:assessment_request, user_email: 'test@example.com')
      expect(ass).to be_valid
    end

    it 'メールアドレスに@がない場合、無効であること' do
      ass = build(:assessment_request, user_email: 'testexample.com')
      expect(ass).not_to be_valid
    end

    it 'メールアドレスに.がない場合、無効であること' do
      ass = build(:assessment_request, user_email: 'test@examplecom')
      expect(ass).not_to be_valid
    end

    it '電話番号が正しい形式の場合、有効であること' do
      ass = build(:assessment_request, user_tel: '08012345678')
      expect(ass).to be_valid
    end

    it '電話番号が0から始まらない場合、無効であること' do
      ass = build(:assessment_request, user_tel: '18012345678')
      expect(ass).not_to be_valid
    end
  end

  describe '文字長さのバリデーションテスト' do
    it 'メールアドレスが範囲内の長さ（100文字以内）の場合、有効であること' do
      ass = build(:assessment_request, user_email: 'test@example.com')
      expect(ass).to be_valid
    end

    it 'メールアドレスが範囲外の長さ（101文字以上）の場合、無効であること' do
      ass = build(:assessment_request, user_email: 'abcdefghijklmnopqrstuvwxyz1234567890abcdefgh
        ijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz@example.com')
      expect(ass).not_to be_valid
    end

    it 'ユーザーの電話番号が10文字の場合、有効であること' do
      ass = build(:assessment_request, user_tel: '0801234567')
      expect(ass).to be_valid
    end

    it 'ユーザーの電話番号が11文字の場合、有効であること' do
      ass = build(:assessment_request, user_tel: '09012345678')
      expect(ass).to be_valid
    end

    it 'ユーザーの電話番号が9文字の場合、無効であること' do
      ass = build(:assessment_request, user_tel: '070123456')
      expect(ass).not_to be_valid
    end

    it 'ユーザーの電話番号が12文字の場合、無効であること' do
      ass = build(:assessment_request, user_tel: '070123456789')
      expect(ass).not_to be_valid
    end
  end
end

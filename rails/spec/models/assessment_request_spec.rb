# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssessmentRequest do
  describe '#valid?' do
    context 'すべての情報が正しく入力されている場合' do
      it '有効であること' do
        assessment = build(:assessment_request)
        expect(assessment).to be_valid
      end
    end
    context '物件の住所が空の場合、' do
      it '無効であること' do
        assessment = build(:assessment_request, property_address: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '物件の専有面積が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_exclusive_area: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '物件の土地面積が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_land_area: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '物件の建物面積が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_building_area: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '物件の建物面積の単位が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_building_area_unit: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '物件の階数が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_floor_area: nil)
        expect(assessment).not_to be_valid
      end
    end
    context 'URLパラメータが空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, url_param: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '部屋のプランが空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_room_plan: nil)
        expect(assessment).not_to be_valid
      end
    end
    context '築年数が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, property_constructed_year: nil)
        expect(assessment).not_to be_valid
      end
    end
    context 'ユーザーのメールアドレスが空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_email: nil)
        expect(assessment).not_to be_valid
      end
    end
    context 'ユーザーの名前が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_name: nil)
        expect(assessment).not_to be_valid
      end
    end
    context 'ユーザーの名前（カナ）が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_name_kana: nil)
        expect(assessment).not_to be_valid
      end
    end
    context 'ユーザーの電話番号が空の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_tel: nil)
        expect(assessment).not_to be_valid
      end
    end
    context 'メールアドレスが正しい形式の場合' do
      it '有効であること' do
        assessment = build(:assessment_request, user_email: 'test@example.com')
        expect(assessment).to be_valid
      end
    end
    context 'メールアドレスに@がない場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_email: 'testexample.com')
        expect(assessment).not_to be_valid
      end
    end
    context 'メールアドレスに.がない場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_email: 'test@examplecom')
        expect(assessment).not_to be_valid
      end
    end
    context '電話番号が正しい形式の場合' do
      it '有効であること' do
        assessment = build(:assessment_request, user_tel: '08012345678')
        expect(assessment).to be_valid
      end
    end
    context '電話番号が0から始まらない場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_tel: '18012345678')
        expect(assessment).not_to be_valid
      end
    end
    context 'メールアドレスが範囲内の長さ（100文字以内）の場合' do
      it '有効であること' do
        assessment = build(:assessment_request, user_email: 'test@example.com')
        expect(assessment).to be_valid
      end
    end
    context 'メールアドレスが範囲外の長さ（101文字以上）の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_email: 'abcdefghijklmnopqrstuvwxyz1234567890abcdefgh
          ijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz@example.com')
        expect(assessment).not_to be_valid
      end
    end
    context 'ユーザーの電話番号が10文字の場' do
      it '有効であること' do
        assessment = build(:assessment_request, user_tel: '0801234567')
        expect(assessment).to be_valid
      end
    end
    context 'ユーザーの電話番号が11文字の場合' do
      it '有効であること' do
        assessment = build(:assessment_request, user_tel: '09012345678')
        expect(assessment).to be_valid
      end
    end
    context 'ユーザーの電話番号が9文字の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_tel: '070123456')
        expect(assessment).not_to be_valid
      end
    end
    context 'ユーザーの電話番号が12文字の場合' do
      it '無効であること' do
        assessment = build(:assessment_request, user_tel: '070123456789')
        expect(assessment).not_to be_valid
      end
    end
  end
end

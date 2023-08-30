# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssessmentRequest do
  describe '#valid?' do
    context '物件種別に応じて必要なフィールドが全て埋まっている場合' do
      context '分譲マンションの場合' do
        it '有効である  こと' do
          assessment = build(:assessment_request, property_type: 1, property_exclusive_area: 30, property_land_area: nil, property_building_area: nil)
          expect(assessment).to be_valid
        end
      end
      context '一戸建ての場合' do
        it '有効であること' do
          assessment = build(:assessment_request, property_type: 2, property_exclusive_area: nil, property_land_area: 30, property_building_area: 30)
          expect(assessment).to be_valid
        end
      end
      context '土地の場合' do
        it '有効であること' do
          assessment = build(:assessment_request, property_type: 3, property_exclusive_area: nil, property_land_area: 30, property_building_area: nil)
          expect(assessment).to be_valid
        end
      end                               
    end

    context 'いずれかの空欄か空の場合' do
      context '物件の住所が空の場合、' do
        it '無効であること' do
          assessment = build(:assessment_request, property_address: nil)
          expect(assessment).not_to be_valid
        end
      end

      context '物件種別がマンションの場合' do
        it do
          assessment = build(:assessment_request, property_type: 1, property_exclusive_area: nil)
          expect(assessment).not_to be_valid
        end
      end

      context '物件種別が戸建ての場合' do
        it do
          assessment = build(:assessment_request, property_type: 2, property_land_area: nil, property_building_area: nil)
          expect(assessment).not_to be_valid

          assessment.property_land_area = 80
          expect(assessment).not_to be_valid

          assessment.property_land_area = nil
          assessment.property_building_area = 50
          expect(assessment).not_to be_valid
        end
      end

      context '物件種別が土地の場合' do
        it do
          assessment = build(:assessment_request, property_type: 3, property_land_area: nil)
          expect(assessment).not_to be_valid

          assessment.property_exclusive_area = 30
          expect(assessment).not_to be_valid

          assessment.property_exclusive_area = nil
          assessment.property_building_area = 30
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
    end

    context 'メールアドレスが正しい形式の場合' do
      it '有効であること' do
        assessment = build(:assessment_request, user_email: 'test@example.com')
        expect(assessment).to be_valid
      end
    end

    context 'メールアドレスが不正な形式の場合' do
      context '@がない場合' do
        it '無効であること' do
          assessment = build(:assessment_request, user_email: 'testexample.com')
          expect(assessment).not_to be_valid
        end
      end

      describe '.がない場合' do
        it '無効であること' do
          assessment = build(:assessment_request, user_email: 'test@examplecom')
          expect(assessment).not_to be_valid
        end
      end

      context '範囲外の長さ（101文字以上）の場合' do
        it '無効であること' do
          assessment = build(:assessment_request, user_email: 'abcdefghijklmnopqrstuvwxyz1234567890abcdefgh
            ijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz@example.com')
          expect(assessment).not_to be_valid
        end
      end
    end

    context '電話番号が正しい形式の場合' do
      it '有効であること' do
        assessment = build(:assessment_request, user_tel: '08012345678')
        expect(assessment).to be_valid
      end
    end

    context '電話番号が不正な形式の場合' do
      context '0から始まらない場合' do
        it '無効であること' do
          assessment = build(:assessment_request, user_tel: '18012345678')
          expect(assessment).not_to be_valid
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
end

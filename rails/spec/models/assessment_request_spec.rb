require 'rails_helper'

RSpec.describe AssessmentRequest, type: :model do
    describe '空白のバリデーションテスト' do
        it 'すべての情報が正しく入力されている時、有効であること' do
            ass = build(:assessment_request)
            expect(ass).to  be_valid
        end

        it '物件の住所が空の場合、無効であること' do
            ass = build(:assessment_request, property_address: nil)
            expect(ass).to_not be_valid
          end
      
          it '物件の種別が空の場合、無効であること' do
            ass = build(:assessment_request, property_type: nil)
            expect(ass).to_not be_valid
          end
      
          it '物件の専有面積が空の場合、無効であること' do
            ass = build(:assessment_request, property_exclusive_area: nil)
            expect(ass).to_not be_valid
          end
      
          it '物件の土地面積が空の場合、無効であること' do
            ass = build(:assessment_request, property_land_area: nil)
            expect(ass).to_not be_valid
          end
      
          it '物件の建物面積が空の場合、無効であること' do
            ass = build(:assessment_request, property_building_area: nil)
            expect(ass).to_not be_valid
          end
      
          it '物件の建物面積の単位が空の場合、無効であること' do
            ass = build(:assessment_request, property_building_area_unit: nil)
            expect(ass).to_not be_valid
          end
      
          it '物件の階数が空の場合、無効であること' do
            ass = build(:assessment_request, property_floor_area: nil)
            expect(ass).to_not be_valid
          end
      
          it 'URLパラメータが空の場合、無効であること' do
            ass = build(:assessment_request, url_param: nil)
            expect(ass).to_not be_valid
          end
      
          it '部屋のプランが空の場合、無効であること' do
            ass = build(:assessment_request, property_room_plan: nil)
            expect(ass).to_not be_valid
          end
      
          it '築年数が空の場合、無効であること' do
            ass = build(:assessment_request, property_constructed_year: nil)
            expect(ass).to_not be_valid
          end
      
          it 'ユーザーのメールアドレスが空の場合、無効であること' do
            ass = build(:assessment_request, user_email: nil)
            expect(ass).to_not be_valid
          end
      
          it 'ユーザーの名前が空の場合、無効であること' do
            ass = build(:assessment_request, user_name: nil)
            expect(ass).to_not be_valid
          end
      
          it 'ユーザーの名前（カナ）が空の場合、無効であること' do
            ass = build(:assessment_request, user_name_kana: nil)
            expect(ass).to_not be_valid
          end
      
          it 'ユーザーの電話番号が空の場合、無効であること' do
            ass = build(:assessment_request, user_tel: nil)
            expect(ass).to_not be_valid
          end
    end
end
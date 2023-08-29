# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Office do
  describe '#valid?' do
    let(:office) { build(:office) }

    context 'name,ieul_company_id,logo_url,address,catch_copy,introductionが存在する場合' do
      it { expect(office).to be_valid }
    end

    context 'ieul_office_idがnilの場合' do
      it {
        office.ieul_office_id = nil
        expect(office).not_to be_valid
      }
    end

    context 'logo_urlがnilの場合' do
      it {
        office.logo_url = nil
        expect(office).not_to be_valid
      }
    end

    context 'addressがnilの場合' do
      it {
        office.address = nil
        expect(office).not_to be_valid
      }
    end

    context 'catch_copyがnilの場合' do
      it {
        office.catch_copy = nil
        expect(office).not_to be_valid
      }
    end

    context 'introductionがnilの場合' do
      it {
        office.introduction = nil
        expect(office).not_to be_valid
      }
    end

    context 'ieul_office_idが重複している場合' do
      it {
        office = create(:office)
        uniqueness_office = build(:office, ieul_office_id: office.ieul_office_id)
        expect(uniqueness_office).not_to be_valid
      }
    end
  end

  describe '評価計算関数の動作チェック' do
    let(:office) { build(:office) }
    let(:office_without_review) { build(:office, id: 2) }
    let(:sale_count) { SaleCount.create(id: 1) }
    let(:sale_reason) { SaleReason.create(id: 1) }
    let(:city) { build(:city) }
    let(:review) { build(:review) }

    before do
      create_list(:review, 3, office: office, city: city, sale_count: sale_count, sale_reason: sale_reason,
                              improvement_point: 'あいうえお')
    end

    context '売却スピードの満足度, 対応満足度, 売却価格の満足度全て' do
      it {
        expect(office.calculate_review_mean).to eq(11.0 / 3)
      }
    end

    context '売却スピードの満足度のみ' do
      it {
        expect(office.calculate_review_mean(
                 include_response: false, include_price: false
               )).to eq(4.0)
      }
    end

    context '対応満足度のみ' do
      it {
        expect(office.calculate_review_mean(
                 include_speed: false, include_price: false
               )).to eq(5.0)
      }
    end

    context '売却価格の満足度のみ' do
      it {
        expect(office.calculate_review_mean(
                 include_speed: false, include_response: false
               )).to eq(2.0)
      }
    end

    context '口コミがない場合' do
      it {
        expect(office_without_review.calculate_review_mean).to eq(0)
      }
    end

    context '引数が全てfalseの場合' do
      it {
        expect do
          office.calculate_review_mean(include_speed: false, include_response: false, include_price: false)
        end.to(raise_error ArgumentError)
      }
    end
  end
end

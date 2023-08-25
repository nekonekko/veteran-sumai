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

    before do
      reviews = create_list(:review, 3)
      assign(:reviews, reviews)
      reviews.each do |review|
        review.office = office
      end
    end

    context '売却スピードの満足度, 対応満足度, 売却価格の満足度全て' do
      it {
        expect(office.calculate_review_mean(office.id)).to eq(11.0/3)
      }
    end

    context '売却スピードの満足度のみ' do
      it {
        expect(office.calculate_review_mean(
          office.id,
          include_response=false,
          include_price=false
        )).to eq(4.0)
      }
    end

    context '対応満足度のみ' do
      it {
        expect(office.calculate_review_mean(
          office.id,
          include_speed=false,
          include_price=false
        )).to eq(5.0)
      }
    end

    context '売却価格の満足度のみ' do
      it {
        expect(office.calculate_review_mean(
          office.id,
          include_speed=false,
          include_response=false
        )).to eq(2.0)
      }
    end

  end
end

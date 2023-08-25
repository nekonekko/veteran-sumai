# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  describe '#valid?' do
    let(:review) { build(:review) }

    context 'すべてのデータが存在する場合' do
      it { expect(review).to be_valid }
    end
    context 'String ,Text、 Date型パラメータがnillの場合' do
      it {
        review.ieul_office_id = nil
        expect(review).not_to be_valid
      }
      it {
        review.gender = nil
        expect(review).not_to be_valid
      }
      it {
        review.property_address = nil
        expect(review).not_to be_valid
      }
      it {
        review.property_type = nil
        expect(review).not_to be_valid
      }
      it {
        review.sale_count = nil
        expect(review).not_to be_valid
      }
      it {
        review.considered_sale_on = nil
        expect(review).not_to be_valid
      }
      it {
        review.assessment_requested_on = nil
        expect(review).not_to be_valid
      }
      it {
        review.sold_on = nil
        expect(review).not_to be_valid
      }
      it {
        review.transfered_on = nil
        expect(review).not_to be_valid
      }
      it {
        review.sale_speed_evaluation = nil
        expect(review).not_to be_valid
      }
      it {
        review.sale_price_evaluation = nil
        expect(review).not_to be_valid
      }
      it {
        review.mediation_contract_form = nil
        expect(review).not_to be_valid
      }
      it {
        review.headline = nil
        expect(review).not_to be_valid
      }
      it {
        review.company_response_evaluation_reason = nil
        expect(review).not_to be_valid
      }
      it {
        review.advice = nil
        expect(review).not_to be_valid
      }
    end

    context '数値パラメータに文字列が入った場合' do
      it {
        review.age = '14'
        expect(review).not_to be_valid
      }
      it {
        review.assessed_price = '3500'
        expect(review).not_to be_valid
      }
      it {
        review.sale_price = '3500'
        expect(review).not_to be_valid
      }
      it {
        review.contract_price = '3500'
        expect(review).not_to be_valid
      }
      it {
        review.price_reduction_how_many_month = '3'
        expect(review).not_to be_valid
      }
      it {
        review.reduced_price = '3500'
        expect(review).not_to be_valid
      }
    end

    context 'Boolean型のパラメータのバリデーション' do
      context 'price_reducedが1の場合' do
        it {
          review.price_reduced = 1
          expect(review).not_to be_valid
        }
      end
      context 'price_reducedが0の場合' do
        it {
          review.price_reduced = 0
          expect(review).not_to be_valid
        }
      end
      context 'price_reducedが1,0以外の場合' do
        it {
          review.price_reduced = 4
          expect(review).not_to be_valid
        }
      end
    end
  end
end

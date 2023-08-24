# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Prefecture do
  describe '#valid?' do
    let(:prefecture) { build(:prefecture, name: name) }

    context 'nameが存在する場合' do
      let(:name) { '北海道' }

      it { expect(prefecture).to be_valid }
    end

    context 'nameがnilの場合' do
      let(:name) { nil }

      it { expect(prefecture).not_to be_valid }
    end
  end

  describe '#association' do
    context 'Cityとの関係が1:Nになっていること' do
      it {
        association = described_class.reflect_on_association(:cities)
        expect(association.macro).to eq(:has_many)
      }
    end

    context 'Cityが削除されると、関連するCityが削除されること' do
      it {
        prefecture = create(:prefecture)
        create(:city, prefecture: prefecture)
        expect { prefecture.destroy }.to change(City, :count).by(-1)
      }
    end
  end
end

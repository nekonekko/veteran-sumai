# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City do
  describe '#valid?' do
    let(:city) { build(:city, name: name, yomi: yomi) }

    context 'name,yomiが入力されている場合' do
      let(:name) { '札幌市' }
      let(:yomi) { 'さっぽろ' }

      it { expect(city).to be_valid }
    end

    context 'nameがnilの場合' do
      let(:name) { nil }
      let(:yomi) { 'さっぽろ' }

      it { expect(city).not_to be_valid }
    end

    context 'yomiがnilの場合' do
      let(:name) { '札幌市' }
      let(:yomi) { nil }

      it { expect(city).not_to be_valid }
    end
  end
end

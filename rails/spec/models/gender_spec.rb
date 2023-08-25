# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gender do
  describe '#confirm' do
    let(:gender) { described_class.find(id) }

    context 'idが0の場合' do
      let(:id) { 0 }

      it { expect(gender.name).to eq '男性' }
    end

    context 'idが1の場合' do
      let(:id) { 1 }

      it { expect(gender.name).to eq '女性' }
    end

    context 'idが2の場合' do
      let(:id) { 2 }

      it { expect(gender.name).to eq 'その他・不明' }
    end
  end
end

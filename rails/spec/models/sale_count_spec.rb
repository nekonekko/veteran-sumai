# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SaleCount do
  describe '#confirm' do
    let(:sale_count) { described_class.find(id) }

    context 'idが0の場合' do
      let(:id) { 0 }

      it { expect(sale_count.name).to eq '初めて' }
    end

    context 'idが1の場合' do
      let(:id) { 1 }

      it { expect(sale_count.name).to eq '2回目' }
    end

    context 'idが2の場合' do
      let(:id) { 2 }

      it { expect(sale_count.name).to eq '3回以上' }
    end
  end
end

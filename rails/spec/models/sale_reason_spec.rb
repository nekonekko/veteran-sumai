# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SaleReason do
  describe '#confirm' do
    let(:sale_reason) { described_class.find(id) }

    context 'idが1の場合' do
      let(:id) { 1 }

      it { expect(sale_reason.name).to eq '住み替え' }
    end

    context 'idが2の場合' do
      let(:id) { 2 }

      it { expect(sale_reason.name).to eq '相続' }
    end

    context 'idが3の場合' do
      let(:id) { 3 }

      it { expect(sale_reason.name).to eq '転職' }
    end

    context 'idが4の場合' do
      let(:id) { 4 }

      it { expect(sale_reason.name).to eq '離婚' }
    end

    context 'idが5の場合' do
      let(:id) { 5 }

      it { expect(sale_reason.name).to eq '資産整理' }
    end

    context 'idが6の場合' do
      let(:id) { 6 }

      it { expect(sale_reason.name).to eq '金銭的な理由' }
    end

    context 'idが99の場合' do
      let(:id) { 99 }

      it { expect(sale_reason.name).to eq 'その他' }
    end
  end
end

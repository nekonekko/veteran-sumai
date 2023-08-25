# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PropertyType do
  describe '#confirm' do
    let(:property_type) { described_class.find(id) }

    context 'idが0の場合' do
      let(:id) { 0 }

      it { expect(property_type.name).to eq 'マンション' }
    end

    context 'idが1の場合' do
      let(:id) { 1 }

      it { expect(property_type.name).to eq '戸建て' }
    end

    context 'idが2の場合' do
      let(:id) { 2 }

      it { expect(property_type.name).to eq '土地' }
    end
  end
end

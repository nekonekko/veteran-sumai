# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MediationContractForm do
  describe '#confirm' do
    let(:mediation_contract_form) { described_class.find(id) }

    context 'idが1の場合' do
      let(:id) { 1 }

      it { expect(mediation_contract_form.name).to eq '専属専任媒介契約' }
    end

    context 'idが2の場合' do
      let(:id) { 2 }

      it { expect(mediation_contract_form.name).to eq '専任媒介契約' }
    end

    context 'idが3の場合' do
      let(:id) { 3 }

      it { expect(mediation_contract_form.name).to eq '一般媒介契約' }
    end

    context 'idが4の場合' do
      let(:id) { 4 }

      it { expect(mediation_contract_form.name).to eq 'わからない' }
    end
  end
end

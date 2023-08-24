# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company do
  describe '#valid?' do
    let(:company) { build(:company, name: name, ieul_company_id: ieul_company_id) }

    context 'name,ieul_company_idが存在する場合' do
      let(:name) { 'Speee不動産' }
      let(:ieul_company_id) { 1 }

      it { expect(company).to be_valid }
    end

    context 'nameがnilの場合' do
      let(:name) { nil }
      let(:ieul_company_id) { 1 }

      it { expect(company).not_to be_valid }
    end

    context 'ieul_company_idがnilの場合' do
        let(:name) { 'Speee不動産' }
        let(:ieul_company_id) { nil }
  
        it { expect(company).not_to be_valid }
      end

      context 'ieul_company_idが重複している場合' do
        it {
            company = create(:company)
            uniqueness_company = build(:company, name: 'PSS不動産', ieul_company_id: company.ieul_company_id)
            expect(uniqueness_company).not_to be_valid
        }
      end
  end
end

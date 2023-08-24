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
end

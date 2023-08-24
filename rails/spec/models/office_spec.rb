# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Office do
  describe '#valid?' do
    let(:office) do
      build(
        :office,
        name: name,
        company: company,
        ieul_office_id: ieul_office_id,
        logo_url: logo_url,
        postal_code: postal_code,
        prefecture: prefecture,
        city: city,
        address: address,
        phone_number: phone_number,
        fax_number: fax_number,
        business_hours: business_hours,
        holiday: holiday,
        catch_copy: catch_copy,
        introduction: introduction
      )
    end

    context 'name,ieul_company_id,logo_url,address,catch_copy,introductionが存在する場合' do
        let(:name) { '札幌市' }
        let(:company) { build(:company) }
        let(:ieul_office_id) { 1 }
        let(:logo_url) { 'https://example.com/logo.png' }
        let(:postal_code) { '123-4567' }
        let(:prefecture) { build(:prefecture) }
        let(:city) { build(:city) }
        let(:address) { '1-2-3 Example Street' }
        let(:phone_number) { '123-456-7890' }
        let(:fax_number) { '987-654-3210' }
        let(:business_hours) { '9:00 AM - 6:00 PM' }
        let(:holiday) { 'Saturday, Sunday' }
        let(:catch_copy) { 'Your catch copy here' }
        let(:introduction) { 'Introduction text' }
  
        it { expect(company).to be_valid }
      end

    context 'ieul_office_idがnilの場合' do
      let(:name) { '札幌市' }
      let(:company) { build(:company) }
      let(:ieul_office_id) { nil }
      let(:logo_url) { 'https://example.com/logo.png' }
      let(:postal_code) { '123-4567' }
      let(:prefecture) { build(:prefecture) }
      let(:city) { build(:city) }
      let(:address) { '1-2-3 Example Street' }
      let(:phone_number) { '123-456-7890' }
      let(:fax_number) { '987-654-3210' }
      let(:business_hours) { '9:00 AM - 6:00 PM' }
      let(:holiday) { 'Saturday, Sunday' }
      let(:catch_copy) { 'Your catch copy here' }
      let(:introduction) { 'Introduction text' }

      it { expect(office).not_to be_valid }
    end

    context 'logo_urlがnilの場合' do
        let(:name) { '札幌市' }
        let(:company) { build(:company) }
        let(:ieul_office_id) { 1 }
        let(:logo_url) { nil }
        let(:postal_code) { '123-4567' }
        let(:prefecture) { build(:prefecture) }
        let(:city) { build(:city) }
        let(:address) { '1-2-3 Example Street' }
        let(:phone_number) { '123-456-7890' }
        let(:fax_number) { '987-654-3210' }
        let(:business_hours) { '9:00 AM - 6:00 PM' }
        let(:holiday) { 'Saturday, Sunday' }
        let(:catch_copy) { 'Your catch copy here' }
        let(:introduction) { 'Introduction text' }
  
        it { expect(office).not_to be_valid }
      end

      context 'addressがnilの場合' do
        let(:name) { '札幌市' }
        let(:company) { build(:company) }
        let(:ieul_office_id) { 1 }
        let(:logo_url) { 'https://example.com/logo.png' }
        let(:postal_code) { '123-4567' }
        let(:prefecture) { build(:prefecture) }
        let(:city) { build(:city) }
        let(:address) { nil }
        let(:phone_number) { '123-456-7890' }
        let(:fax_number) { '987-654-3210' }
        let(:business_hours) { '9:00 AM - 6:00 PM' }
        let(:holiday) { 'Saturday, Sunday' }
        let(:catch_copy) { 'Your catch copy here' }
        let(:introduction) { 'Introduction text' }
  
        it { expect(office).not_to be_valid }
      end

      context 'catch_copyがnilの場合' do
        let(:name) { '札幌市' }
        let(:company) { build(:company) }
        let(:ieul_office_id) { 1 }
        let(:logo_url) { 'https://example.com/logo.png' }
        let(:postal_code) { '123-4567' }
        let(:prefecture) { build(:prefecture) }
        let(:city) { build(:city) }
        let(:address) { '1-2-3 Example Street' }
        let(:phone_number) { '123-456-7890' }
        let(:fax_number) { '987-654-3210' }
        let(:business_hours) { '9:00 AM - 6:00 PM' }
        let(:holiday) { 'Saturday, Sunday' }
        let(:catch_copy) { nil }
        let(:introduction) { 'Introduction text' }
  
        it { expect(office).not_to be_valid }
      end

      context 'introductionがnilの場合' do
        let(:name) { '札幌市' }
        let(:company) { build(:company) }
        let(:ieul_office_id) { 1 }
        let(:logo_url) { 'https://example.com/logo.png' }
        let(:postal_code) { '123-4567' }
        let(:prefecture) { build(:prefecture) }
        let(:city) { build(:city) }
        let(:address) { '1-2-3 Example Street' }
        let(:phone_number) { '123-456-7890' }
        let(:fax_number) { '987-654-3210' }
        let(:business_hours) { '9:00 AM - 6:00 PM' }
        let(:holiday) { 'Saturday, Sunday' }
        let(:catch_copy) { 'Your catch copy here' }
        let(:introduction) { nil }
  
        it { expect(office).not_to be_valid }
      end

      context 'ieul_office_idが重複している場合' do
        it {
            office = create(:office)
            uniqueness_office = build(:office, ieul_office_id: office.ieul_office_id)
            expect(uniqueness_office).not_to be_valid
        }
      end
  end

  describe '#association' do
    context 'Companyとの関係がN:1になっていること' do
      it { expect(described_class.reflect_on_association(:company).macro).to eq :belongs_to }
    end

    context 'Prefectureとの関係がN:1になっていること' do
      it { expect(described_class.reflect_on_association(:prefecture).macro).to eq :belongs_to }
    end

    context 'Cityとの関係がN:1になっていること' do
      it { expect(described_class.reflect_on_association(:city).macro).to eq :belongs_to }
    end

    context 'AssessmentAreaとの関係が1:Nになっていること' do
      it { expect(described_class.reflect_on_association(:assessment_areas).macro).to eq :has_many }
    end

    context 'officeが削除されると、関連するofficeが削除されること' do
      it {
        office = create(:office)
        city = create(:city)
        create(:assessment_area, office: office, city: city)
        expect { office.destroy }.to change(AssessmentArea, :count).by(-1)
      }
    end
  end
end

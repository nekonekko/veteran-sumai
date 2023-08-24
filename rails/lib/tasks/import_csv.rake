# frozen_string_literal: true

namespace :import_csv do # rubocop:disable Metrics/BlockLength
  require 'zip'
  require 'csv'

  desc ''
  task prefecture: :environment do
    Zip::File.open('tmp/prefecture.csv.zip') do |zip_file|
      entry = zip_file.glob('prefecture.csv').first
      data = entry.get_input_stream.read

      ActiveRecord::Base.transaction do
        CSV.parse(data, headers: true).each do |row|
          prefecture = Prefecture.find_or_initialize_by(id: row['id'])
          prefecture.update!(name: row['name'])
        end
      end
    end
  end

  desc ''
  task city: :environment do
    Zip::File.open('tmp/city.csv.zip') do |zip_file|
      entry = zip_file.glob('city.csv').first
      data = entry.get_input_stream.read

      ActiveRecord::Base.transaction do
        CSV.parse(data, headers: true).each do |row|
          city = City.find_or_initialize_by(id: row['id'])
          city.update!(
            prefecture_id: row['prefecture_id'],
            name: row['name'],
            yomi: row['yomi']
          )
        end
      end
    end
  end

  desc ''
  task company: :environment do
    Zip::File.open('tmp/company_and_office.csv.zip') do |zip_file|
      entry = zip_file.glob('company_and_office.csv').first
      data = entry.get_input_stream.read

      ActiveRecord::Base.transaction do
        CSV.parse(data.force_encoding('UTF-8'), headers: true).each do |row|
          company = Company.find_or_initialize_by(ieul_company_id: row['ieul_企業id'].to_i)
          company.update!(
            name: row['企業名'],
            ieul_company_id: row['ieul_企業id'].to_i
          )
        end
      end
    end
  end

  desc ''
  task office: :environment do
    Zip::File.open('tmp/company_and_office.csv.zip') do |zip_file|
      entry = zip_file.glob('company_and_office.csv').first
      data = entry.get_input_stream.read

      ActiveRecord::Base.transaction do
        CSV.parse(data.force_encoding('UTF-8'), headers: true).each do |row|
          office = Office.find_or_initialize_by(ieul_office_id: row['ieul_店舗id'].to_i)
          office.update!(
            name: row['店舗'],
            company_id: row['ieul_企業id'].to_i,
            ieul_office_id: row['ieul_店舗id'].to_i,
            logo_url: row['ロゴURL'],
            postal_code: row['郵便番号'],
            prefecture_id: Prefecture.find_by(name: row['都道府県']).id,
            city_id: City.find_by(name: row['市区町村']).id,
            address: row['以降住所'],
            phone_number: row['電話番号'],
            fax_number: row['FAX番号'],
            business_hours: row['営業時間'],
            holiday: row['定休日'],
            catch_copy: row['キャッチコピー'],
            introduction: row['紹介文']
          )
        end
      end
    end
  end
end

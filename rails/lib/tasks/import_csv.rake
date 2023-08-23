# frozen_string_literal: true

namespace :import_csv do
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
          puts row['ieul_企業id'].to_i.class
          company = Company.find_or_initialize_by(id: row['ieul_企業id'].to_i)
          company.update!(
            name: row['企業名'],
            ieul_company_id: row['ieul_企業id'].to_i
          )
        end
      end
    end
  end
end

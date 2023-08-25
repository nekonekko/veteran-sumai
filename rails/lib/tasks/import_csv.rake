# frozen_string_literal: true

namespace :import_csv do # rubocop:disable Metrics/BlockLength
  require 'zip'
  require 'csv'

  desc 'すべてのcsv.zipを読み込みテーブルに挿入する'
  task all: :environment do
    Rake::Task['import_csv:prefecture'].invoke
    Rake::Task['import_csv:city'].invoke
    Rake::Task['import_csv:company'].invoke
    Rake::Task['import_csv:office'].invoke
  end

  desc 'lib/assets/prefecture.csv.zipを読み込みprefecturesテーブルに挿入する'
  task prefecture: :environment do
    Zip::File.open('lib/assets/prefecture.csv.zip') do |zip_file|
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

  desc 'lib/assets/city.csv.zipを読み込みcitiesテーブルに挿入する'
  task city: :environment do
    Zip::File.open('lib/assets/city.csv.zip') do |zip_file|
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

  desc 'lib/assets/company_and_office.csv.zipを読み込みcompaniesテーブルに挿入する'
  task company: :environment do
    Zip::File.open('lib/assets/company_and_office.csv.zip') do |zip_file|
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

  desc 'lib/assets/company_and_office.csv.zipを読み込みofficesテーブルに挿入する'
  task office: :environment do
    Zip::File.open('lib/assets/company_and_office.csv.zip') do |zip_file|
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

  desc 'lib/assets/review.zipを読み込みreviewsテーブルに挿入する'
  task review: :environment do
    sale_count_list = { '初めて' => 0, '2回目' => 1, '3回以上' => 3 }
    mediation_contract_form_list = { '専属専任媒介契約' => 0, '専任媒介契約' => 1, '一般媒介契約' => 3, 'わからない' => 4 }
    sale_reason_list = { '住み替え' => 0, '相続' => 1, '転職' => 2, '離婚' => 3, '資産整理' => 4, '金銭的な理由' => 5, 'その他' => 6 }
    property_type_list = { 'マンション' => 0, '戸建て' => 1, '土地' => 2 }
    gender_list = { '男性' => 0, '女性' => 1, 'その他・不明' => 2 }
    price_reduced_list = { 0 => false, 1 => true }
    Zip::File.open('lib/assets/review.csv.zip') do |zip_file|
      entry = zip_file.glob('review.csv').first
      data = entry.get_input_stream.read

      ActiveRecord::Base.transaction do
        CSV.parse(data.force_encoding('UTF-8'), headers: true).each do |row|
          Review.create!(
            office_id: row['ieul_店舗id'].to_i,
            ieul_office_id: row['ieul_店舗id'].to_i,
            username: row['名前'],
            gender: gender_list[row['性別']],
            age: row['年齢'].to_i,
            city_id: City.find_by(name: row['市区町村']).id,
            property_address: row['住所全部'],
            property_type: property_type_list[row['物件種別']],
            sale_count: sale_count_list[row['売却回数']],
            considered_sale_on: row['売却検討時期'],
            assessment_requested_on: row['査定依頼時期'],
            started_selling_on: row['売出時期'],
            sold_on: row['売却時期'],
            transfered_on: row['引渡時期'],
            sale_speed_evaluation: row['売却スピードの満足度'].to_i,
            assessed_price: row['査定価格'].to_i,
            sale_price: row['販売価格'].to_i,
            price_reduced: row['この会社に決めた理由'].to_i == 1,
            price_reduction_how_many_month: row['売り出してから何ヶ月後に値下げしたか'].to_i,
            reduced_price: row['値下げ価格'].to_i,
            contract_price: row['成約価格'].to_i,
            sale_price_evaluation: row['売却価格の満足度'].to_i,
            mediation_contract_form: row['媒介契約の形態'].to_i,
            headline: row['見出し'],
            sale_reason: sale_reason_list[row['売却理由']].to_i,
            sale_anxiety_reason: row['売却時に不安だったこと'],
            choose_agent_reaseon: row['この会社に決めた理由'],
            company_response_evaluation: row['不動産会社の対応満足度'],
            company_response_evaluation_reason: row['不動産会社の対応満足度の理由'].to_i,
            advice: row['今後売却する人へのアドバイス'],
            improvement_point: row['不動産会社に改善してほしい点']
          )
        end
      end
    end
  end
end

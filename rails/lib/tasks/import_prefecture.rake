namespace :import_prefecture_csv do
    require 'zip'
    require 'csv'
    
    desc "" 
    task import: :environment do 
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
  end
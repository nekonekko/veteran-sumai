# frozen_string_literal: true

FactoryBot.define do
    factory :office do
      name { '赤坂店' }
      company
      ieul_office_id { 1 }
      logo_url {'https://foodslink.jp/syokuzaihyakka/syun/fruit/abricotto/anzu21s.jpg'}
      postal_code {'329-1224'}
      prefecture
      city
      address {'品川2丁目'}
      phone_number {'03-0000-0000'}
      fax_number {'03-0000-0000'}
      business_hours {'平日9:00～18:00'}
      holiday {'水曜日、祝日、GW、他'}
      catch_copy {'不動産の売却はSpeee1不動産にお任せください'}
      introduction {'Speee1不動産港区支店にお任せください東京都の不動産売却の実績多数です。'}
    end
  end
  
FactoryBot.define do
    factory :assessment_request do
        office
        city
        property_address {'物件の住所'}
        property_type {0}
        property_exclusive_area {100.0}
        property_land_area {100.0}
        property_building_area {100.0}
        property_building_area_unit {0}
        property_floor_area {100.0}
        url_param {'example.com'}
        property_room_plan {0}
        property_constructed_year {0}
        user_email {'test@example.com'}
        user_name {'屁野 茂辺地'}
        user_name_kana {'への もへじ'}
        user_tel {'08012345678'}
    end
end


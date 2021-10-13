FactoryBot.define do
  factory :pur_shi_add do

    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    price { 2000 }
  end
end

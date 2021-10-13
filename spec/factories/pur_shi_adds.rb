FactoryBot.define do
  factory :pur_shi_add do

    token {"tok_abcdefghijk00000000000000000"}
    pos_code { '123-4567' }
    prefect_id { 42 }
    municipal { 'エテルノ' }
    add { '1-1' }
    build { 'モニモニ' }
    tel_num { "09876543212" }
  end
end

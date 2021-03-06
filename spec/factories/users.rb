FactoryBot.define do
  factory :user do
    nickname              { 'moni'}
    email                 {Faker::Internet.free_email}
    password              {'2525mn'}
    password_confirmation {password}
    name_ue               {'蒼井'}
    name_st               {'雪枝'}
    kana_ue               {'アオイ'}
    kana_st               {'ユキエ'}
   birthday               {'2000-6-16'}
  end
end
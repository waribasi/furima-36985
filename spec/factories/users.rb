FactoryBot.define do
  factory :user do
    nickname              {'moni'}
    email                 {'moni@moni'}
    password              {'252539'}
    password_confirmation {password}
    name_ue               {'蒼井'}
    name_st               {'雪枝'}
    kana_ue               {'アオイ'}
    kana_st               {'ユキエ'}
   birthday               {'2000-6-16'}
  end
end
FactoryBot.define do
  factory :item do
  image            {}
  item             {'メロンパン'}
  exp              {'メロンパンはもう飽きたー！'}
  cate_id          {1}
  status_id        {1}
  del_fee_id       {1}
  area_id          {1}
  del_day_id       {1}
  price            {2000}
  association :user
  end
end

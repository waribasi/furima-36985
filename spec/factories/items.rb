FactoryBot.define do
  factory :item do
  item             {'メロンパン'}
  exp              {'メロンパンはもう飽きたー！'}
  cate_id          {3}
  status_id        {3}
  del_fee_id       {3}
  area_id          {3}
  del_day_id       {3}
  price            {2000}
  association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/1f6a1b50-5a12-4ab1-a403-173bd29b87c1.png'), filename: '1f6a1b50-5a12-4ab1-a403-173bd29b87c1.png')
  end
  end
end

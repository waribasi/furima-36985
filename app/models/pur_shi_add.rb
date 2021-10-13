class PurShiAdd
  include ActiveModel::Model
  attr_accessor :pos_code, :prefect_id, :municipal, :add, :build, :tel_num, :item, :del_fee, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :pos_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :pos_code
    validates :prefect_id
    validates :municipal
    validates :add
    validates :tel_num, format: { with: /\A\d{10,11}\z/}
    validates :token, presence: true
  end
  validates :prefect_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    pur = Pur.create(item_id: item_id, user_id: user_id)
    ShiAdd.create(pos_code: pos_code, prefect_id: prefect_id, municipal: municipal, add: add, build: build, tel_num: tel_num, pur_id: pur.id)
  end
end



# 以下はメモ欄-----------------------------------------------
# /\A\d{10,11}\z/
# item_id: item.id
# rails g rspec:model pur_shi_add
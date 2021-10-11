class ItemShiAdd
  include ActiveModel::Model
  attr_accessor :pos_code, :prefect, :municipal, :add, :build, :tel_num, :item, :exp, :cate, :status, :del_fee, :area, :del_day, :price, :user_id

  with_options presence: true do
    validates :pos_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :price, format: { with: /\A[0-9]+\z/}, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :tel_num, format: { with: /\A\d{10,11}\z/}
  end
  validates :del_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefect, numericality: {other_than: 1, message: "can't be blank"}

  def save
    item = Item.create(user_id: user_id)
    ShiAdd.create(pos_cod: pos_cod, prefect: prefect, municipal: municipal, build: build, tel_num: tel_num, item_id: item.id)
  end
  end

end
/\A\d{10,11}\z/
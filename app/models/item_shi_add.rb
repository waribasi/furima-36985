class ItemShiAdd
  include ActiveModel::Model
  attr_accessor :pos_code, :prefect, :municipal, :add, :build, :tel_num, :item, :del_fee, :price, :user_id

  with_options presence: true do
    validates :pos_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :price, format: { with: /\A[0-9]+\z/}, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  validates :del_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefect, numericality: {other_than: 0, message: "can't be blank"}
end
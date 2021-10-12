class ShiAdd < ApplicationRecord

  validates :pos_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefect_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipal, presence: true
  validates :add, presence: true
  validates :build, presence: true
  validates :tel_num, presence: true

  belongs_to :pur
end

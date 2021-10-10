class ShiAdd < ApplicationRecord

  validates :pos_code, presence: true
  validates :prefect_id, presence: true
  validates :municipal, presence: true
  validates :add, presence: true
  validates :build, presence: true
  validates :tel_num, presence: true

  belongs_to :pur
end

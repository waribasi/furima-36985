class Pur < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :item
  has_one :shi_add
  belongs_to :prefect
end

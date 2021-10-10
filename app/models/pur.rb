class Pur < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shi_add
end

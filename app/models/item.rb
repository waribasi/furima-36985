class Item < ApplicationRecord

  validates :item, presence: true
  validates :exp, presence: true
  validates :cate_id, presence: true
  validates :status_id, presence: true
  validates :del_fee_id, presence: true
  validates :area_id, presence: true
  validates :del_day_id, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end

#以下は後にitemsコントローラに記載する何か
# def message_params
#   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
# end

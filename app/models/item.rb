class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item, presence: true
  validates :exp, presence: true
  validates :cate_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :del_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :del_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/}, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  belongs_to :user
  has_one_attached :image
  belongs_to :area
  belongs_to :cate
  belongs_to :del_day
  belongs_to :del_fee
  belongs_to :status
end

# 以下はメモ欄ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
#以下は後にitemsコントローラに記載する何か
# def message_params
#   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
# end

# extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :cate

#   # validates :, presence: true
#   validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

# 価格は、¥300~¥9999999の間のみ保存可能であること。
# 価格は半角数値のみ保存可能であること。
# 入力された価格によって、販売手数料や販売利益の表示が変わること。

# length: { maximum: 6 }
class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
end

#以下は後にitemsコントローラに記載する何か
# def message_params
#   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
# end

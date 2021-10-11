class PursController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
  # (item_params)
  private

  def item_params
    # itemの情報が送られてきてない...
    params.require(:item).permit(:image, :item, :del_fee_id, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

# 以下はメモ欄----------------------------------------------------------------------
# , item_id: params[:item_id]
# user_id: current_user.id
# (params[:id])

class PursController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item_shi_add = ItemShiAdd.new
  end

  def create
    @item_shi_add = ItemShiAdd.new(item_params)
    if @item_shi_add.valid?
      @item_shi_add.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :exp, :cate, :status, :del_fee, :area, :del_day, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  

end

# 以下はメモ欄----------------------------------------------------------------------
# , item_id: params[:item_id]
# user_id: current_user.id
# (params[:id])

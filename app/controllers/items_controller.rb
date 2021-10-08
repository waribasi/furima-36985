class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    #binding.pry
    @item = Item.create(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :exp, :cate_id, :status_id, :del_fee_id, :area_id, :del_day_id, :price).merge(user_id: current_user.id)
  end

end
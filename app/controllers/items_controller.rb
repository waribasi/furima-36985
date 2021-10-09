class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id 
    @item.destroy
    redirect_to root_path
    else
      redirect_to item_path
    end
  end

# 以下は今後の実装で使うコントローラーなので今はコメントアウトする
  # def edit
  # end

  # def update
  # end

  # 7つのアクション全ての実装が完了したらルーティングのresourcesをまとめる
# ここまで

  private

  def item_params
    params.require(:item).permit(:image, :item, :exp, :cate_id, :status_id, :del_fee_id, :area_id, :del_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

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
  @item = Item.find(params[:id])
  end
  
# 以下は今後の実装で使うコントローラーなので今はコメントアウトする
  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  # 7つのアクション全ての実装が完了したらルーティングのresourcesをまとめる
# ここまで

  private

  def item_params
    params.require(:item).permit(:image, :item, :exp, :cate_id, :status_id, :del_fee_id, :area_id, :del_day_id, :price).merge(user_id: current_user.id)
  end

end
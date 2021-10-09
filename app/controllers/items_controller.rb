class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index, :new, :create, :update, :destroy, :show]

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

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
   else
    redirect_to edit_item_path
   end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :exp, :cate_id, :status_id, :del_fee_id, :area_id, :del_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user.id == current_user.id  #投稿者idとログインユーザーのidが一致しなければ
      redirect_to action: :index
    end
 end
end
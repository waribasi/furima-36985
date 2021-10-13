class PursController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    @pur_shi_add = PurShiAdd.new
    move_to_index
  end

  def create
    @item = Item.find(params[:item_id])
    @pur_shi_add = PurShiAdd.new(pur_params)
    if @pur_shi_add.valid?
      pay_item
      @pur_shi_add.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :exp, :cate, :status, :del_fee, :area, :del_day, :price).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pur_params
    params.require(:pur_shi_add).permit(:@item_price, :pos_code, :prefect_id, :add, :municipal, :build, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    # payjpの処理
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: pur_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
    # payjpの処理
  end

  def move_to_index
    unless @item.user.id != current_user.id
      redirect_to root_path
    end
  end

end

# 以下はメモ欄----------------------------------------------------------------------

class PursController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @pur_shi_add = PurShiAdd.new
  end

  def new
    # @pur_shi_add = PurShiAdd.new
  end

  def create
    # binding.pry
    @pur_shi_add = PurShiAdd.new(pur_params)
    if @pur_shi_add.valid?
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
    # ここにpur_shi_addのparamsをかく
    params.require(:pur_shi_add).permit(:@item_price, :pos_code, :prefect_id, :add, :municipal, :build, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # fromオブジェクトの参考コード
  # def donation_params
  #   params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  # end


  

end

# 以下はメモ欄----------------------------------------------------------------------
# , item_id: params[:item_id]
# user_id: current_user.id
# (params[:id])
# params.require(:order).permit(:price).merge(token: params[:token])
# , token: params[:token]
# item_id: item_id
# item_id: ここに購入するitem_idを取得する
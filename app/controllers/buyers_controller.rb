class BuyersController < ApplicationController

  def index
    @buyer_Address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :municipality, :address, :house_number, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[item_id])
  end
end

class BuyersController < ApplicationController

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save(current_user.id)
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :municipality, :address, :house_number, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    price = Item.find(params[:item_id]).price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end

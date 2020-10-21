class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save(current_user.id)
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :municipality, :address, :house_number, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    if current_user == @item.user
      redirect_to root_path
    end
  end
end

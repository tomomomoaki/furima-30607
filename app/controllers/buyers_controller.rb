class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @buyer = Buyer.new(buyer_params)
    if @buyer.valid?
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def buyer_params
    params.require(:buyer).permit().merge(token: params[:token])
  end
end

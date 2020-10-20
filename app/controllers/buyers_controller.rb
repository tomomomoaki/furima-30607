class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

end

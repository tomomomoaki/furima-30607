class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
    @item = Item.find(params[:id])
  end

  def create
  end

end

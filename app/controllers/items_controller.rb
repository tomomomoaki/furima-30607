class ItemsController < ApplicationController
  before_action :redirect_signin, only: :new

  def index
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def redirect_signin
    redirect_to new_user_session_path unless user_signed_in?
  end
end

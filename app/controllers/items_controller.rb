class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destory]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :destroy]
  before_action :redirect_root_bought, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
    #binding.pry
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.delete
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless current_user == @item.user
  end

  def redirect_root_bought
    redirect_to root_path unless @item.buyer.nil?
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    redirect_to root_path if current_user.id != @item.user.id
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if current_user.id != @item.user.id
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end

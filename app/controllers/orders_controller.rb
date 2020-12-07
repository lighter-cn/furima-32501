class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @payment = Payment.new
  end
end

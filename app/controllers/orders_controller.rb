class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @payment = Payment.new
  end
end

class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @payment = Payment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @payment = Payment.new(payment_params)
    if @payment.valid?
      @payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def payment_params
      params.permit(:post_number, :prefecture_id, :city, :house_number, :phone_number)
    end
end

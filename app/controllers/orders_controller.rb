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
      params.permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :post_number, :prefecture_id, :city, :house_number, :phone_number).merge(user: current_user.id, item: params[:item_id])
    end
end

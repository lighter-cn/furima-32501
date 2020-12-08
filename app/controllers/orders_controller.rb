class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :is_buyer?
  before_action :is_sold?

  def index
    @payment = Payment.new
    @test = Order.where(item_id: @item.id)
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.valid?
      pay_item
      @payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:post_number, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: payment_params[:token],
      currency: 'jpy'
    )
  end

  def is_buyer?
    redirect_to root_path if current_user.id == @item.user.id
  end

  def is_sold?
    redirect_to root_path unless @item.order.nil?
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end

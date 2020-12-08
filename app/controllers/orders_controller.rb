class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_buyer?
  # before_action :is_sold?
  def index
    @item = Item.find(params[:item_id])
    @payment = Payment.new
    @test = Order.where(item_id: @item.id)
  end

  def create
    @item = Item.find(params[:item_id])
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
      params.require(:payment).permit(:post_number, :prefecture_id, :city, :house_number,:building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: payment_params[:token],
        currency: 'jpy'
      )
    end

    def is_buyer?
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user.id
        redirect_to root_path
      end
    end

    def is_sold?
      @item = Item.find(params[:item_id])
      # もしオーダーに商品のレコードがあれば
      if Order.where(item_id: @item.id)
        redirect_to root_path
      end
    end
end

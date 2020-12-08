class Payment
  include ActiveModel::Model
  attr_accessor :user, :item, :card_number, :card_exp_month, :card_exp_year, :card_cvc,:post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :order

  with_options presence: true do
    validates :user
    validates :item
    # validates :token
    validates :card_number
    validates :card_exp_month
    validates :card_exp_year
    validates :card_cvc
    validates :post_number   ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id , numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number , numericality: {only_integer: true},length: { maximum: 11 }
    validates :order
  end

  def save
    Order.create(id: user, item: item)
    ShippingAddress.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, order: order)
  end
end
class Payment
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :order

  with_options presence: true do
    # validates :user
    # validates :item
    # validates :token
    validates :post_number   ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id , numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number , numericality: {only_integer: true}
    validates :order
  end

  def save
    Purchase.create()
    ShippingAddress.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number, order: order)
  end
end
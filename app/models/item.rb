class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :prefecture
  belongs_to :shipping_charge

  has_one_attached :image

  validates :category_id,        numericality: { other_than: 1 }
  validates :condition_id,       numericality: { other_than: 1 }
  validates :delivery_date_id,   numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
  end
  # with_options presence: true, format: { with: /\d{}/ } 
  # end
end

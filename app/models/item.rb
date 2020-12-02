class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :prefecture
  belongs_to :shipping_charge

  has_one_attached :image

  validates :category,        numericality: { other_than: 1 }
  validates :condition,       numericality: { other_than: 1 }
  validates :delivery_date,   numericality: { other_than: 1 }
  validates :prefecture,      numericality: { other_than: 1 }
  validates :shipping_charge, numericality: { other_than: 1 }
end

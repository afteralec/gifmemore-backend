class Item < ApplicationRecord
  has_many :item_carts
  has_many :item_categories
  has_many :item_orders

  has_many :carts, through: :item_carts
  has_many :categories, through: :item_categories
  has_many :orders, through: :item_orders

  validates_presence_of :title, :price, :image
end

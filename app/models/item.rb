class Item < ApplicationRecord
  has_many :item_categories
  has_many :item_orders

  has_many :categories, through: :item_categories
  has_many :order, through: :item_orders
end

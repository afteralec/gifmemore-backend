class Item < ApplicationRecord
  has_many :item_categories
  has_many :item_purchases

  has_many :categories, through: :item_categories
  has_many :purchases, through: :item_purchases
end

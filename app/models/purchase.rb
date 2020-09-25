class Purchase < ApplicationRecord
  belongs_to :user
  has_many :item_purchases
end

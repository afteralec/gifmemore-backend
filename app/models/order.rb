class Order < ApplicationRecord
  belongs_to :user, required: true
  has_many :item_orders
  has_many :items, through: :item_orders

  validates_presence_of :user, :address, :amount
end

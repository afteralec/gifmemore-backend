class Order < ApplicationRecord
  belongs_to :user, required: true
  has_many :item_orders
  has_many :items, through: :item_orders

  validates_presence_of :user, :address, :amount
  
   # method added for creating records in join table upon order instantiation
  def addToOrder(item_ids)
    item_ids.each { |item_id| ItemOrder.create(order: self, item_id: item_id) }
  end 
end

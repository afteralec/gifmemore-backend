class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders

  # method added for creating records in join table upon order instantiation
  def addToOrder(itemIds)
    itemIds.each(itemId => ItemOrder.create(order_id: self.id, item_id: itemId))
  end 

end

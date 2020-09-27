class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders

  # method added for creating records in join table upon order instantiation
  def addToOrder(item_ids)
    
    item_ids.each { |item_id| ItemOrder.create(order: self, item_id: item_id) }
  end 

end

class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :item_orders
  has_many :items, through: :item_orders
  serialize :address
  # accepts_nested_attributes_for :item_orders

  validates_presence_of :address, :amount
  # macro for private method
  after_create :associate_items
 
 
  attr_writer :item_ids 
# line above is the same as below but shorter...
  # def item_ids=(item_ids)
  #   @item_ids = item_ids 
  # end 

  private 

  def associate_items 
    @item_ids.each { |item_id| ItemOrder.create(order: self, item_id: item_id) }
  end
end

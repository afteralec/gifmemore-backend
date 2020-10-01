class Cart < ApplicationRecord
  belongs_to :user, required: true
  has_many :item_carts, dependent: :destroy
  has_many :items, through: :item_carts

  validates_presence_of :user


  def self.total(item_ids)
    
   total = item_ids.sum{ |id| Item.find(id).price.to_f} 
   
    return total
  end
end

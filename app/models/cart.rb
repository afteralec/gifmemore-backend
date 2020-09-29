class Cart < ApplicationRecord
  belongs_to :user, required: true

  validates_presence_of :user


  def self.total(item_ids)
    
   total = item_ids.sum{ |id| Item.find(id).price.to_f} 
   
    return total
  end
end

class ItemCart < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :cart
end

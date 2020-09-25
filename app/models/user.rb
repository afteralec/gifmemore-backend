class User < ApplicationRecord
  has_one :cart
  has_many :purchases
end

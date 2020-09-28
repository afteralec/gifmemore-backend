class User < ApplicationRecord
  has_one :cart
  has_many :orders

  validates_presence_of :name, :dob, :email, :address
  validates_uniqueness_of :email

  after_create :create_cart

  private

  def create_cart
    Cart.create(user: self)
  end
end

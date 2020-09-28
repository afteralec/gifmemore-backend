class Cart < ApplicationRecord
  belongs_to :user, required: true

  validates_presence_of :user
end

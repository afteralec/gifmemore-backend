require 'rails_helper'

describe Order do
  describe 'Associations' do
    it { should belong_to(:user).optional }
    it { should have_many(:items) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:amount) }
  end
end

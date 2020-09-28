require 'rails_helper'

describe Order do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end

  describe 'Validations' do
    [:user, :address, :amount].each do |validation|
      it { should validate_presence_of(validation) }
    end
  end
end

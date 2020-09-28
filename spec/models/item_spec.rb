require 'rails_helper'

describe Item do
  describe 'Associatons' do
    it { should have_many(:categories) }
    it { should have_many(:orders) }
  end

  describe 'Validations' do
    [:title, :price, :image].each do |validation|
      it { should validate_presence_of(validation) }
    end
  end
end

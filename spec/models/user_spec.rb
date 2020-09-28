require 'rails_helper'

describe User do
  describe 'Associations' do
    it { should have_one(:cart) }
  end

  describe 'Validations' do
    [:name, :dob, :email, :address].each do |validation|
      it { should validate_presence_of(validation) }
    end
  end
  
  subject do
    described_class.new(
      name: 'Dan Abramov',
      email: 'dan@abramov.org',
      dob: Date.iso8601('1694-09-17'),
      address: 'localhost:3000'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without date of birth' do
    subject.dob = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an address' do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it 'has a single cart' do
    subject.save
    expect(subject.cart).to_not be(nil)
  end
end

require 'rails_helper'

describe Cart do
  describe 'Associatons' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:user) }
  end

  let(:user) do
    User.create(
      name: 'Dan Abramov',
      email: 'dan@abramov.org',
      dob: Date.iso8601('1694-09-17'),
      address: 'localhost:3000'
    )
  end

  subject { user.cart }

  it 'should be instantiated with each user' do
    expect(subject).to_not be(nil)
  end

  it 'should always have an associated user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end

require 'rails_helper'

describe 'User' do
  it 'has no delete route' do
    expect(delete: '/users/1').to_not be_routable
  end
end

describe 'Item' do
  it 'is exposed at /api/v1/items' do
    expect(get: 'api/v1/items').to route_to(
      controller: 'api/v1/items',
      action: 'index'
    )
  end
end

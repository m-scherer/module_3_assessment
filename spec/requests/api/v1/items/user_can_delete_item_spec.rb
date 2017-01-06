require 'rails_helper'

describe 'As a User' do
  context 'GET /api/v1/items' do
    it 'returns items with id, name, description, and url' do
      items = create_list(:item, 2)

      delete "/api/v1/items/#{items.first.id}"
      parsed = JSON.parse(response.body, :symbolize_names => true)

      items_returned = Item.all

      expect(response).to be_success
      expect(items_returned).to eq(1)
      expect(items_returned.first).to eq(items[1])
    end
  end
end

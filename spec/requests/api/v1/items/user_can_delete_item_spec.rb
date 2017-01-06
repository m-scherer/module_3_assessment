require 'rails_helper'

describe 'As a User' do
  context 'DELETE /api/v1/items' do
    it 'returns items with id, name, description, and url' do
      items = create_list(:item, 2)

      delete "/api/v1/items/#{items.first.id}"

      items_returned = Item.all

      expect(response).to be_success
      expect(items_returned.count).to eq(1)
      expect(items_returned.first).to eq(items[1])
    end
  end
end

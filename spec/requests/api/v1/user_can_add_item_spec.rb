require 'rails_helper'

describe 'As a User' do
  context 'POST /api/v1/items' do
    it 'returns items with id, name, description, and url' do
      params = {
          name: "Test item",
          description: "Blah",
          image_url: "www.test.com"
        }

      post "/api/v1/items", params: params

      parsed = JSON.parse(response.body, :symbolize_names => true)
      items_returned = Item.all
      expect(response).to be_success
      expect(items_returned.count).to eq(1)
      expect(items_returned.first).to be_instance_of(Item)
      expect(parsed).to be_instance_of(Hash)
      expect(parsed).to have_key(:id)
      expect(parsed).to have_key(:name)
      expect(parsed).to have_key(:description)
      expect(parsed).to have_key(:image_url)
      expect(parsed).to_not have_key(:created_at)
      expect(parsed).to_not have_key(:updated_at)
    end
  end
end

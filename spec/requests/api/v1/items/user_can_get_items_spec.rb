require 'rails_helper'

describe 'As a User' do
  context 'GET /api/v1/items' do
    it 'returns items with id, name, description, and url' do
      item = create_list(:item, 2)

      get '/api/v1/items'
      parsed = JSON.parse(response.body, :symbolize_names => true)
      item_returned = parsed.first

      expect(response).to be_success
      expect(parsed).to be_instance_of(Array)
      expect(parsed.count).to eq(2)
      expect(item_returned).to have_key(:id)
      expect(item_returned).to have_key(:name)
      expect(item_returned).to have_key(:description)
      expect(item_returned).to have_key(:image_url)
      expect(item_returned).to_not have_key(:created_at)
      expect(item_returned).to_not have_key(:updated_at)
    end
  end
end

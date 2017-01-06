require 'rails_helper'

describe 'As a User' do
  context 'GET /api/v1/items' do
    it 'returns items with id, name, description, and url' do
      items = create_list(:item, 2)

      get "/api/v1/items/#{items.first.id}"
      parsed = JSON.parse(response.body, :symbolize_names => true)

      expect(response).to be_success
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

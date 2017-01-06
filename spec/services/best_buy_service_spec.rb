require 'rails_helper'

describe BestBuyService do
  context '#find_stores_by_zip_area' do
    it 'can find stores' do
      zip = 80202
      area = 25

      response = BestBuyService.new.find_stores_by_zip_area(zip,area)
      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_instance_if(Hash)
      expect(body).to have_key(:stores)
    end
  end
end

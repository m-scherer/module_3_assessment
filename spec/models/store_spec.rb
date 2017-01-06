require 'rails_helper'

describe Store do
  context '#create_stores' do
    it 'can create stores' do
      VCR.use_cassette('.create_stores') do
        zip = 80202
        area = 25

        stores = Store.create_stores(zip, area)
        store = stores.first

        expect(stores).to be_instance_of(Array)
        expect(store).to be_instance_of(Store)
        expect(store).to respond_to(:name)
        expect(store).to respond_to(:city)
        expect(store).to respond_to(:distance)
        expect(store).to respond_to(:phone)
        expect(store).to respond_to(:type)
      end
    end
  end
end

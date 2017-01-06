require 'rails_helper'

describe 'As a user' do
  context 'when I visit root and search' do
    it 'returns stores within 25 miles' do
      VCR.use_cassette('.search_stores') do
        # When I visit "/"
        visit root_path
        # And I fill in a search box with "80202" and click "search"
        fill_in :Search, with: "80202"
        click_on "Search"

        # Then my current path should be "/search" (ignoring params)
        expect(current_path).to eq(search_index_path)
        # And I should see stores within 25 miles of 80202
        # And I should see a message that says "16 Total Stores"
        expect(page).to have_content("16 Total Stores")
        # And I should see exactly 15 results
        expect(page).to have_selector('#store', count: 16)
        # And I should see the long name, city, distance, phone number and store type for each of the 15 results
        expect(page).to have_content("Name:")
        expect(page).to have_content("City:")
        expect(page).to have_content("Distance:")
        expect(page).to have_content("Phone:")
        expect(page).to have_content("Type:")
      end
    end
  end
end

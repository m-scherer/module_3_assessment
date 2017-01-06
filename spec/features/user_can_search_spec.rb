require 'rails_helper'

describe 'As a user' do
  context 'when I visit root and search' do
    it 'returns stores within 25 miles' do
      VCR.use_cassette('.search_stores') do
        visit root_path
        fill_in :Search, with: "80202"
        click_on "Search"

        expect(current_path).to eq(search_index_path)
        expect(page).to have_content("16 Total Stores")
        expect(page).to have_selector('#store', count: 16)
        expect(page).to have_content("Name:")
        expect(page).to have_content("City:")
        expect(page).to have_content("Distance:")
        expect(page).to have_content("Phone:")
        expect(page).to have_content("Type:")
      end
    end
  end
end

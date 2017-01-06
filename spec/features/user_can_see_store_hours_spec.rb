require 'rails_helper'

describe 'As a user' do
  context 'When I click a store' do
    it 'shows me store hours' do
      VCR.use_cassette('.find_store_hours') do
        visit root_path
        fill_in :Search, with: "80202"
        click_on "Search"
        click_link('#store-name')

        expect(current_path).to eq(store_path)
        expect(page).to have_content("Name:")
        expect(page).to have_content("City:")
        expect(page).to have_content("Distance:")
        expect(page).to have_content("Phone:")
        expect(page).to have_content("Type:")
        expect(page).to have_content("Hours:")
      end
    end
  end
end
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm

require 'spec_helper'
require 'capybara/rspec'

describe "Tile posting flow", js: true do
  include SpecTestHelper
  # let(:user) { FactoryGirl.create(:user) }
  let!(:existing_user) { FactoryGirl.create(:user) }
  let!(:tile) { FactoryGirl.build(:tile) }

  it "allows a user to search for a song" do
    visit root_path
    signin(existing_user)
    within(".top-bar") do
      fill_in "search-bar", with: "Flume X WKND - Hyper Paradise"
      click_link "search-button"
    end
    save_and_open_page
    expect(page).to have_content "Flume X"
  end


  # def post_tile(user, tile)
    # user can search songs through soundcloud, write message & post tile
    # click_link "Post a Tile"
    # within(".new-tile-message") do
    #   fill_in "tile_message", with: tile.message
    # end
    # click_button "Post"
    # expect(page).to have_content tile.message
  # end

end
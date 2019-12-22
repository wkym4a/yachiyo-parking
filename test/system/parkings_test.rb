require "application_system_test_case"

class ParkingsTest < ApplicationSystemTestCase
  setup do
    @parking = parkings(:one)
  end

  test "visiting the index" do
    visit parkings_url
    assert_selector "h1", text: "Parkings"
  end

  test "creating a Parking" do
    visit parkings_url
    click_on "New Parking"

    fill_in "Address", with: @parking.address
    fill_in "Empty number", with: @parking.empty_number
    fill_in "Lat", with: @parking.lat
    fill_in "Lon", with: @parking.lon
    fill_in "Managing memo", with: @parking.managing_memo
    fill_in "Memo", with: @parking.memo
    fill_in "Name", with: @parking.name
    fill_in "Number", with: @parking.number
    fill_in "Price", with: @parking.price
    fill_in "Status", with: @parking.status
    fill_in "Symbol", with: @parking.symbol
    fill_in "User", with: @parking.user_id
    click_on "Create Parking"

    assert_text "Parking was successfully created"
    click_on "Back"
  end

  test "updating a Parking" do
    visit parkings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @parking.address
    fill_in "Empty number", with: @parking.empty_number
    fill_in "Lat", with: @parking.lat
    fill_in "Lon", with: @parking.lon
    fill_in "Managing memo", with: @parking.managing_memo
    fill_in "Memo", with: @parking.memo
    fill_in "Name", with: @parking.name
    fill_in "Number", with: @parking.number
    fill_in "Price", with: @parking.price
    fill_in "Status", with: @parking.status
    fill_in "Symbol", with: @parking.symbol
    fill_in "User", with: @parking.user_id
    click_on "Update Parking"

    assert_text "Parking was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking" do
    visit parkings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking was successfully destroyed"
  end
end

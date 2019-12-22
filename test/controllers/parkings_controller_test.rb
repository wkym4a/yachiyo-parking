require 'test_helper'

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking = parkings(:one)
  end

  test "should get index" do
    get parkings_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_url
    assert_response :success
  end

  test "should create parking" do
    assert_difference('Parking.count') do
      post parkings_url, params: { parking: { address: @parking.address, empty_number: @parking.empty_number, lat: @parking.lat, lon: @parking.lon, managing_memo: @parking.managing_memo, memo: @parking.memo, name: @parking.name, number: @parking.number, price: @parking.price, status: @parking.status, symbol: @parking.symbol, user_id: @parking.user_id } }
    end

    assert_redirected_to parking_url(Parking.last)
  end

  test "should show parking" do
    get parking_url(@parking)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_url(@parking)
    assert_response :success
  end

  test "should update parking" do
    patch parking_url(@parking), params: { parking: { address: @parking.address, empty_number: @parking.empty_number, lat: @parking.lat, lon: @parking.lon, managing_memo: @parking.managing_memo, memo: @parking.memo, name: @parking.name, number: @parking.number, price: @parking.price, status: @parking.status, symbol: @parking.symbol, user_id: @parking.user_id } }
    assert_redirected_to parking_url(@parking)
  end

  test "should destroy parking" do
    assert_difference('Parking.count', -1) do
      delete parking_url(@parking)
    end

    assert_redirected_to parkings_url
  end
end

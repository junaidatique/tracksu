require 'test_helper'

class Tracksu::PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracksu_place = tracksu_places(:one)
  end

  test "should get index" do
    get tracksu_places_url
    assert_response :success
  end

  test "should get new" do
    get new_tracksu_place_url
    assert_response :success
  end

  test "should create tracksu_place" do
    assert_difference('Tracksu::Place.count') do
      post tracksu_places_url, params: { tracksu_place: {  } }
    end

    assert_redirected_to tracksu_place_url(Tracksu::Place.last)
  end

  test "should show tracksu_place" do
    get tracksu_place_url(@tracksu_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracksu_place_url(@tracksu_place)
    assert_response :success
  end

  test "should update tracksu_place" do
    patch tracksu_place_url(@tracksu_place), params: { tracksu_place: {  } }
    assert_redirected_to tracksu_place_url(@tracksu_place)
  end

  test "should destroy tracksu_place" do
    assert_difference('Tracksu::Place.count', -1) do
      delete tracksu_place_url(@tracksu_place)
    end

    assert_redirected_to tracksu_places_url
  end
end

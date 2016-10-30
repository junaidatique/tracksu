require 'test_helper'

class Tracksu::PurposesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracksu_purpose = tracksu_purposes(:one)
  end

  test "should get index" do
    get tracksu_purposes_url
    assert_response :success
  end

  test "should get new" do
    get new_tracksu_purpose_url
    assert_response :success
  end

  test "should create tracksu_purpose" do
    assert_difference('Tracksu::Purpose.count') do
      post tracksu_purposes_url, params: { tracksu_purpose: { activated: @tracksu_purpose.activated, title: @tracksu_purpose.title } }
    end

    assert_redirected_to tracksu_purpose_url(Tracksu::Purpose.last)
  end

  test "should show tracksu_purpose" do
    get tracksu_purpose_url(@tracksu_purpose)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracksu_purpose_url(@tracksu_purpose)
    assert_response :success
  end

  test "should update tracksu_purpose" do
    patch tracksu_purpose_url(@tracksu_purpose), params: { tracksu_purpose: { activated: @tracksu_purpose.activated, title: @tracksu_purpose.title } }
    assert_redirected_to tracksu_purpose_url(@tracksu_purpose)
  end

  test "should destroy tracksu_purpose" do
    assert_difference('Tracksu::Purpose.count', -1) do
      delete tracksu_purpose_url(@tracksu_purpose)
    end

    assert_redirected_to tracksu_purposes_url
  end
end

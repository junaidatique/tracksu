require 'test_helper'

class Tracksu::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracksu_user = tracksu_users(:one)
  end

  test "should get index" do
    get tracksu_users_url
    assert_response :success
  end

  test "should get new" do
    get new_tracksu_user_url
    assert_response :success
  end

  test "should create tracksu_user" do
    assert_difference('Tracksu::User.count') do
      post tracksu_users_url, params: { tracksu_user: { activated: @tracksu_user.activated, email: @tracksu_user.email, name: @tracksu_user.name } }
    end

    assert_redirected_to tracksu_user_url(Tracksu::User.last)
  end

  test "should show tracksu_user" do
    get tracksu_user_url(@tracksu_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracksu_user_url(@tracksu_user)
    assert_response :success
  end

  test "should update tracksu_user" do
    patch tracksu_user_url(@tracksu_user), params: { tracksu_user: { activated: @tracksu_user.activated, email: @tracksu_user.email, name: @tracksu_user.name } }
    assert_redirected_to tracksu_user_url(@tracksu_user)
  end

  test "should destroy tracksu_user" do
    assert_difference('Tracksu::User.count', -1) do
      delete tracksu_user_url(@tracksu_user)
    end

    assert_redirected_to tracksu_users_url
  end
end

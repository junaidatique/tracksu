require 'test_helper'

class Tracksu::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracksu_product = tracksu_products(:one)
  end

  test "should get index" do
    get tracksu_products_url
    assert_response :success
  end

  test "should get new" do
    get new_tracksu_product_url
    assert_response :success
  end

  test "should create tracksu_product" do
    assert_difference('Tracksu::Product.count') do
      post tracksu_products_url, params: { tracksu_product: { activated: @tracksu_product.activated, title: @tracksu_product.title } }
    end

    assert_redirected_to tracksu_product_url(Tracksu::Product.last)
  end

  test "should show tracksu_product" do
    get tracksu_product_url(@tracksu_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracksu_product_url(@tracksu_product)
    assert_response :success
  end

  test "should update tracksu_product" do
    patch tracksu_product_url(@tracksu_product), params: { tracksu_product: { activated: @tracksu_product.activated, title: @tracksu_product.title } }
    assert_redirected_to tracksu_product_url(@tracksu_product)
  end

  test "should destroy tracksu_product" do
    assert_difference('Tracksu::Product.count', -1) do
      delete tracksu_product_url(@tracksu_product)
    end

    assert_redirected_to tracksu_products_url
  end
end

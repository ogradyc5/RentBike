require 'test_helper'

class StoreBikesControllerTest < ActionController::TestCase
  setup do
    @store_bike = store_bikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_bikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_bike" do
    assert_difference('StoreBike.count') do
      post :create, store_bike: { bike_id: @store_bike.bike_id, store_id: @store_bike.store_id }
    end

    assert_redirected_to store_bike_path(assigns(:store_bike))
  end

  test "should show store_bike" do
    get :show, id: @store_bike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_bike
    assert_response :success
  end

  test "should update store_bike" do
    patch :update, id: @store_bike, store_bike: { bike_id: @store_bike.bike_id, store_id: @store_bike.store_id }
    assert_redirected_to store_bike_path(assigns(:store_bike))
  end

  test "should destroy store_bike" do
    assert_difference('StoreBike.count', -1) do
      delete :destroy, id: @store_bike
    end

    assert_redirected_to store_bikes_path
  end
end

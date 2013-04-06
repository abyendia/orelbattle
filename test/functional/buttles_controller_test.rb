require 'test_helper'

class ButtlesControllerTest < ActionController::TestCase
  setup do
    @buttle = buttles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buttles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buttle" do
    assert_difference('Buttle.count') do
      post :create, buttle: {  }
    end

    assert_redirected_to buttle_path(assigns(:buttle))
  end

  test "should show buttle" do
    get :show, id: @buttle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buttle
    assert_response :success
  end

  test "should update buttle" do
    put :update, id: @buttle, buttle: {  }
    assert_redirected_to buttle_path(assigns(:buttle))
  end

  test "should destroy buttle" do
    assert_difference('Buttle.count', -1) do
      delete :destroy, id: @buttle
    end

    assert_redirected_to buttles_path
  end
end

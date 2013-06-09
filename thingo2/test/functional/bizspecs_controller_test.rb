require 'test_helper'

class BizspecsControllerTest < ActionController::TestCase
  setup do
    @bizspec = bizspecs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bizspecs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bizspec" do
    assert_difference('Bizspec.count') do
      post :create, :bizspec => @bizspec.attributes
    end

    assert_redirected_to bizspec_path(assigns(:bizspec))
  end

  test "should show bizspec" do
    get :show, :id => @bizspec.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bizspec.to_param
    assert_response :success
  end

  test "should update bizspec" do
    put :update, :id => @bizspec.to_param, :bizspec => @bizspec.attributes
    assert_redirected_to bizspec_path(assigns(:bizspec))
  end

  test "should destroy bizspec" do
    assert_difference('Bizspec.count', -1) do
      delete :destroy, :id => @bizspec.to_param
    end

    assert_redirected_to bizspecs_path
  end
end

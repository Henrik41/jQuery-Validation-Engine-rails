require 'test_helper'

class Category2sControllerTest < ActionController::TestCase
  setup do
    @category2 = category2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category2" do
    assert_difference('Category2.count') do
      post :create, :category2 => @category2.attributes
    end

    assert_redirected_to category2_path(assigns(:category2))
  end

  test "should show category2" do
    get :show, :id => @category2.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @category2.to_param
    assert_response :success
  end

  test "should update category2" do
    put :update, :id => @category2.to_param, :category2 => @category2.attributes
    assert_redirected_to category2_path(assigns(:category2))
  end

  test "should destroy category2" do
    assert_difference('Category2.count', -1) do
      delete :destroy, :id => @category2.to_param
    end

    assert_redirected_to category2s_path
  end
end

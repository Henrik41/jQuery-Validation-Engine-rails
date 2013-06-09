require 'test_helper'

class ObjsControllerTest < ActionController::TestCase
  setup do
    @obj = objs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obj" do
    assert_difference('Obj.count') do
      post :create, :obj => @obj.attributes
    end

    assert_redirected_to obj_path(assigns(:obj))
  end

  test "should show obj" do
    get :show, :id => @obj.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @obj.to_param
    assert_response :success
  end

  test "should update obj" do
    put :update, :id => @obj.to_param, :obj => @obj.attributes
    assert_redirected_to obj_path(assigns(:obj))
  end

  test "should destroy obj" do
    assert_difference('Obj.count', -1) do
      delete :destroy, :id => @obj.to_param
    end

    assert_redirected_to objs_path
  end
end

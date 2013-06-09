require 'test_helper'

class AddinfosControllerTest < ActionController::TestCase
  setup do
    @addinfo = addinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addinfo" do
    assert_difference('Addinfo.count') do
      post :create, :addinfo => @addinfo.attributes
    end

    assert_redirected_to addinfo_path(assigns(:addinfo))
  end

  test "should show addinfo" do
    get :show, :id => @addinfo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @addinfo.to_param
    assert_response :success
  end

  test "should update addinfo" do
    put :update, :id => @addinfo.to_param, :addinfo => @addinfo.attributes
    assert_redirected_to addinfo_path(assigns(:addinfo))
  end

  test "should destroy addinfo" do
    assert_difference('Addinfo.count', -1) do
      delete :destroy, :id => @addinfo.to_param
    end

    assert_redirected_to addinfos_path
  end
end

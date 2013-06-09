require 'test_helper'

class SpecsControllerTest < ActionController::TestCase
  setup do
    @spec = specs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spec" do
    assert_difference('Spec.count') do
      post :create, :spec => @spec.attributes
    end

    assert_redirected_to spec_path(assigns(:spec))
  end

  test "should show spec" do
    get :show, :id => @spec.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @spec.to_param
    assert_response :success
  end

  test "should update spec" do
    put :update, :id => @spec.to_param, :spec => @spec.attributes
    assert_redirected_to spec_path(assigns(:spec))
  end

  test "should destroy spec" do
    assert_difference('Spec.count', -1) do
      delete :destroy, :id => @spec.to_param
    end

    assert_redirected_to specs_path
  end
end

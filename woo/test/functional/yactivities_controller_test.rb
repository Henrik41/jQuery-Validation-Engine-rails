require 'test_helper'

class YactivitiesControllerTest < ActionController::TestCase
  setup do
    @yactivity = yactivities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yactivities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yactivity" do
    assert_difference('Yactivity.count') do
      post :create, yactivity: { user_id: @yactivity.user_id }
    end

    assert_redirected_to yactivity_path(assigns(:yactivity))
  end

  test "should show yactivity" do
    get :show, id: @yactivity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yactivity
    assert_response :success
  end

  test "should update yactivity" do
    put :update, id: @yactivity, yactivity: { user_id: @yactivity.user_id }
    assert_redirected_to yactivity_path(assigns(:yactivity))
  end

  test "should destroy yactivity" do
    assert_difference('Yactivity.count', -1) do
      delete :destroy, id: @yactivity
    end

    assert_redirected_to yactivities_path
  end
end

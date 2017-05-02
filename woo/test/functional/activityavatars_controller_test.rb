require 'test_helper'

class ActivityavatarsControllerTest < ActionController::TestCase
  setup do
    @activityavatar = activityavatars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activityavatars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activityavatar" do
    assert_difference('Activityavatar.count') do
      post :create, activityavatar: { activity_id: @activityavatar.activity_id }
    end

    assert_redirected_to activityavatar_path(assigns(:activityavatar))
  end

  test "should show activityavatar" do
    get :show, id: @activityavatar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activityavatar
    assert_response :success
  end

  test "should update activityavatar" do
    put :update, id: @activityavatar, activityavatar: { activity_id: @activityavatar.activity_id }
    assert_redirected_to activityavatar_path(assigns(:activityavatar))
  end

  test "should destroy activityavatar" do
    assert_difference('Activityavatar.count', -1) do
      delete :destroy, id: @activityavatar
    end

    assert_redirected_to activityavatars_path
  end
end

require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, activity: { about: @activity.about, end_date: @activity.end_date, end_time: @activity.end_time, location: @activity.location, numpart: @activity.numpart, price: @activity.price, recurrent: @activity.recurrent, start_date: @activity.start_date, start_time: @activity.start_time, title: @activity.title, user_id: @activity.user_id, website: @activity.website }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should show activity" do
    get :show, id: @activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity
    assert_response :success
  end

  test "should update activity" do
    put :update, id: @activity, activity: { about: @activity.about, end_date: @activity.end_date, end_time: @activity.end_time, location: @activity.location, numpart: @activity.numpart, price: @activity.price, recurrent: @activity.recurrent, start_date: @activity.start_date, start_time: @activity.start_time, title: @activity.title, user_id: @activity.user_id, website: @activity.website }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    assert_redirected_to activities_path
  end
end

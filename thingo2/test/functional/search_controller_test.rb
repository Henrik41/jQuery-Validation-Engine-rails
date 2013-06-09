require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get company" do
    get :company
    assert_response :success
  end

  test "should get item" do
    get :item
    assert_response :success
  end

  test "should get person" do
    get :person
    assert_response :success
  end

end

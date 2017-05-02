require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get searchactivities" do
    get :searchactivities
    assert_response :success
  end

end

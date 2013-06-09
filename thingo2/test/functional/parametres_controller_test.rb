require 'test_helper'

class ParametresControllerTest < ActionController::TestCase
  setup do
    @parametre = parametres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parametres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parametre" do
    assert_difference('Parametre.count') do
      post :create, :parametre => @parametre.attributes
    end

    assert_redirected_to parametre_path(assigns(:parametre))
  end

  test "should show parametre" do
    get :show, :id => @parametre.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @parametre.to_param
    assert_response :success
  end

  test "should update parametre" do
    put :update, :id => @parametre.to_param, :parametre => @parametre.attributes
    assert_redirected_to parametre_path(assigns(:parametre))
  end

  test "should destroy parametre" do
    assert_difference('Parametre.count', -1) do
      delete :destroy, :id => @parametre.to_param
    end

    assert_redirected_to parametres_path
  end
end

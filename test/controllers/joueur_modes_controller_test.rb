require 'test_helper'

class JoueurModesControllerTest < ActionController::TestCase
  setup do
    @joueur_mode = joueur_modes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joueur_modes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joueur_mode" do
    assert_difference('JoueurMode.count') do
      post :create, joueur_mode: { joueur_id: @joueur_mode.joueur_id, mode_id: @joueur_mode.mode_id }
    end

    assert_redirected_to joueur_mode_path(assigns(:joueur_mode))
  end

  test "should show joueur_mode" do
    get :show, id: @joueur_mode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joueur_mode
    assert_response :success
  end

  test "should update joueur_mode" do
    patch :update, id: @joueur_mode, joueur_mode: { joueur_id: @joueur_mode.joueur_id, mode_id: @joueur_mode.mode_id }
    assert_redirected_to joueur_mode_path(assigns(:joueur_mode))
  end

  test "should destroy joueur_mode" do
    assert_difference('JoueurMode.count', -1) do
      delete :destroy, id: @joueur_mode
    end

    assert_redirected_to joueur_modes_path
  end
end

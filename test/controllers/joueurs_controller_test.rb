# -*- encoding : utf-8 -*-
require 'test_helper'

class JoueursControllerTest < ActionController::TestCase
  setup do
    @joueur = joueurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joueurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joueur" do
    assert_difference('Joueur.count') do
      post :create, joueur: { is_active: @joueur.is_active, pseudo: @joueur.pseudo }
    end

    assert_redirected_to joueur_path(assigns(:joueur))
  end

  test "should show joueur" do
    get :show, id: @joueur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joueur
    assert_response :success
  end

  test "should update joueur" do
    patch :update, id: @joueur, joueur: { is_active: @joueur.is_active, pseudo: @joueur.pseudo }
    assert_redirected_to joueur_path(assigns(:joueur))
  end

  test "should destroy joueur" do
    assert_difference('Joueur.count', -1) do
      delete :destroy, id: @joueur
    end

    assert_redirected_to joueurs_path
  end
end

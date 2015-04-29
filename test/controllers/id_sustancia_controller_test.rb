require 'test_helper'

class IdSustanciaControllerTest < ActionController::TestCase
  setup do
    @id_sustancium = id_sustancia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:id_sustancia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create id_sustancium" do
    assert_difference('IdSustancium.count') do
      post :create, id_sustancium: { consumo: @id_sustancium.consumo, fecha: @id_sustancium.fecha, ingreso: @id_sustancium.ingreso, saldo: @id_sustancium.saldo }
    end

    assert_redirected_to id_sustancium_path(assigns(:id_sustancium))
  end

  test "should show id_sustancium" do
    get :show, id: @id_sustancium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @id_sustancium
    assert_response :success
  end

  test "should update id_sustancium" do
    patch :update, id: @id_sustancium, id_sustancium: { consumo: @id_sustancium.consumo, fecha: @id_sustancium.fecha, ingreso: @id_sustancium.ingreso, saldo: @id_sustancium.saldo }
    assert_redirected_to id_sustancium_path(assigns(:id_sustancium))
  end

  test "should destroy id_sustancium" do
    assert_difference('IdSustancium.count', -1) do
      delete :destroy, id: @id_sustancium
    end

    assert_redirected_to id_sustancia_path
  end
end

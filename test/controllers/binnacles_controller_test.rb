require 'test_helper'

class BinnaclesControllerTest < ActionController::TestCase
  setup do
    @binnacle = binnacles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:binnacles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create binnacle" do
    assert_difference('Binnacle.count') do
      post :create, binnacle: { consumo: @binnacle.consumo, fecha: @binnacle.fecha, idSustancia: @binnacle.idSustancia, ingreso: @binnacle.ingreso, saldo: @binnacle.saldo }
    end

    assert_redirected_to binnacle_path(assigns(:binnacle))
  end

  test "should show binnacle" do
    get :show, id: @binnacle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @binnacle
    assert_response :success
  end

  test "should update binnacle" do
    patch :update, id: @binnacle, binnacle: { consumo: @binnacle.consumo, fecha: @binnacle.fecha, idSustancia: @binnacle.idSustancia, ingreso: @binnacle.ingreso, saldo: @binnacle.saldo }
    assert_redirected_to binnacle_path(assigns(:binnacle))
  end

  test "should destroy binnacle" do
    assert_difference('Binnacle.count', -1) do
      delete :destroy, id: @binnacle
    end

    assert_redirected_to binnacles_path
  end
end

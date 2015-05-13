require 'test_helper'

class EquipmentControllerTest < ActionController::TestCase
  setup do
    @equipment = equipment(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipment" do
    assert_difference('Equipment.count') do
      post :create, equipment: { adquisition_date: @equipment.adquisition_date, bill: @equipment.bill, brand: @equipment.brand, buy_order: @equipment.buy_order, calibrated: @equipment.calibrated, cost: @equipment.cost, extention: @equipment.extention, investigation: @equipment.investigation, last_calibration: @equipment.last_calibration, location: @equipment.location, management: @equipment.management, model: @equipment.model, name: @equipment.name, national_good: @equipment.national_good, responsible: @equipment.responsible, serial: @equipment.serial, status: @equipment.status, teaching: @equipment.teaching, use: @equipment.use }
    end

    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should show equipment" do
    get :show, id: @equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipment
    assert_response :success
  end

  test "should update equipment" do
    patch :update, id: @equipment, equipment: { adquisition_date: @equipment.adquisition_date, bill: @equipment.bill, brand: @equipment.brand, buy_order: @equipment.buy_order, calibrated: @equipment.calibrated, cost: @equipment.cost, extention: @equipment.extention, investigation: @equipment.investigation, last_calibration: @equipment.last_calibration, location: @equipment.location, management: @equipment.management, model: @equipment.model, name: @equipment.name, national_good: @equipment.national_good, responsible: @equipment.responsible, serial: @equipment.serial, status: @equipment.status, teaching: @equipment.teaching, use: @equipment.use }
    assert_redirected_to equipment_path(assigns(:equipment))
  end

  test "should destroy equipment" do
    assert_difference('Equipment.count', -1) do
      delete :destroy, id: @equipment
    end

    assert_redirected_to equipment_index_path
  end
end

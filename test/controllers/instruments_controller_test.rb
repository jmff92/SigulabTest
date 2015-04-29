require 'test_helper'

class InstrumentsControllerTest < ActionController::TestCase
  setup do
    @instrument = instruments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instruments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instrument" do
    assert_difference('Instrument.count') do
      post :create, instrument: { brand: @instrument.brand, capacity: @instrument.capacity, extention: @instrument.extention, investigation: @instrument.investigation, last_calibration: @instrument.last_calibration, location: @instrument.location, management: @instrument.management, material: @instrument.material, measurement_unit: @instrument.measurement_unit, model: @instrument.model, name: @instrument.name, national_good: @instrument.national_good, responsible: @instrument.responsible, status: @instrument.status, teaching: @instrument.teaching, use: @instrument.use }
    end

    assert_redirected_to instrument_path(assigns(:instrument))
  end

  test "should show instrument" do
    get :show, id: @instrument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instrument
    assert_response :success
  end

  test "should update instrument" do
    patch :update, id: @instrument, instrument: { brand: @instrument.brand, capacity: @instrument.capacity, extention: @instrument.extention, investigation: @instrument.investigation, last_calibration: @instrument.last_calibration, location: @instrument.location, management: @instrument.management, material: @instrument.material, measurement_unit: @instrument.measurement_unit, model: @instrument.model, name: @instrument.name, national_good: @instrument.national_good, responsible: @instrument.responsible, status: @instrument.status, teaching: @instrument.teaching, use: @instrument.use }
    assert_redirected_to instrument_path(assigns(:instrument))
  end

  test "should destroy instrument" do
    assert_difference('Instrument.count', -1) do
      delete :destroy, id: @instrument
    end

    assert_redirected_to instruments_path
  end
end

require 'test_helper'

class ChemicalSubstancesControllerTest < ActionController::TestCase
  setup do
    @chemical_substance = chemical_substances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chemical_substances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chemical_substance" do
    assert_difference('ChemicalSubstance.count') do
      post :create, chemical_substance: { cas: @chemical_substance.cas, controlled: @chemical_substance.controlled, corrosive: @chemical_substance.corrosive, dangerous: @chemical_substance.dangerous, expiration_date: @chemical_substance.expiration_date, explosive: @chemical_substance.explosive, extention: @chemical_substance.extention, inflamable: @chemical_substance.inflamable, investigation: @chemical_substance.investigation, irritating: @chemical_substance.irritating, legal_regime: @chemical_substance.legal_regime, location: @chemical_substance.location, management: @chemical_substance.management, matter_states: @chemical_substance.matter_states, name: @chemical_substance.name, nocive: @chemical_substance.nocive, oxidant: @chemical_substance.oxidant, purity: @chemical_substance.purity, quantity: @chemical_substance.quantity, rI4: @chemical_substance.rI4, rI7: @chemical_substance.rI7, responsible: @chemical_substance.responsible, status: @chemical_substance.status, teaching: @chemical_substance.teaching, toxic: @chemical_substance.toxic, use: @chemical_substance.use }
    end

    assert_redirected_to chemical_substance_path(assigns(:chemical_substance))
  end

  test "should show chemical_substance" do
    get :show, id: @chemical_substance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chemical_substance
    assert_response :success
  end

  test "should update chemical_substance" do
    patch :update, id: @chemical_substance, chemical_substance: { cas: @chemical_substance.cas, controlled: @chemical_substance.controlled, corrosive: @chemical_substance.corrosive, dangerous: @chemical_substance.dangerous, expiration_date: @chemical_substance.expiration_date, explosive: @chemical_substance.explosive, extention: @chemical_substance.extention, inflamable: @chemical_substance.inflamable, investigation: @chemical_substance.investigation, irritating: @chemical_substance.irritating, legal_regime: @chemical_substance.legal_regime, location: @chemical_substance.location, management: @chemical_substance.management, matter_states: @chemical_substance.matter_states, name: @chemical_substance.name, nocive: @chemical_substance.nocive, oxidant: @chemical_substance.oxidant, purity: @chemical_substance.purity, quantity: @chemical_substance.quantity, rI4: @chemical_substance.rI4, rI7: @chemical_substance.rI7, responsible: @chemical_substance.responsible, status: @chemical_substance.status, teaching: @chemical_substance.teaching, toxic: @chemical_substance.toxic, use: @chemical_substance.use }
    assert_redirected_to chemical_substance_path(assigns(:chemical_substance))
  end

  test "should destroy chemical_substance" do
    assert_difference('ChemicalSubstance.count', -1) do
      delete :destroy, id: @chemical_substance
    end

    assert_redirected_to chemical_substances_path
  end
end

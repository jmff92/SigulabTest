require 'test_helper'

class RelationLoansControllerTest < ActionController::TestCase
  setup do
    @relation_loan = relation_loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relation_loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relation_loan" do
    assert_difference('RelationLoan.count') do
      post :create, relation_loan: { item: @relation_loan.item, prestamo: @relation_loan.prestamo }
    end

    assert_redirected_to relation_loan_path(assigns(:relation_loan))
  end

  test "should show relation_loan" do
    get :show, id: @relation_loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relation_loan
    assert_response :success
  end

  test "should update relation_loan" do
    patch :update, id: @relation_loan, relation_loan: { item: @relation_loan.item, prestamo: @relation_loan.prestamo }
    assert_redirected_to relation_loan_path(assigns(:relation_loan))
  end

  test "should destroy relation_loan" do
    assert_difference('RelationLoan.count', -1) do
      delete :destroy, id: @relation_loan
    end

    assert_redirected_to relation_loans_path
  end
end

require 'test_helper'

class RelationServicesControllerTest < ActionController::TestCase
  setup do
    @relation_service = relation_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relation_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relation_service" do
    assert_difference('RelationService.count') do
      post :create, relation_service: { item: @relation_service.item, servicio: @relation_service.servicio }
    end

    assert_redirected_to relation_service_path(assigns(:relation_service))
  end

  test "should show relation_service" do
    get :show, id: @relation_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relation_service
    assert_response :success
  end

  test "should update relation_service" do
    patch :update, id: @relation_service, relation_service: { item: @relation_service.item, servicio: @relation_service.servicio }
    assert_redirected_to relation_service_path(assigns(:relation_service))
  end

  test "should destroy relation_service" do
    assert_difference('RelationService.count', -1) do
      delete :destroy, id: @relation_service
    end

    assert_redirected_to relation_services_path
  end
end

require 'test_helper'

class ToolsControllerTest < ActionController::TestCase
  setup do
    @tool = tools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool" do
    assert_difference('Tool.count') do
      post :create, tool: { bill: @tool.bill, brand: @tool.brand, extention: @tool.extention, from_set: @tool.from_set, investigation: @tool.investigation, location: @tool.location, management: @tool.management, material: @tool.material, name: @tool.name, national_good: @tool.national_good, responsible: @tool.responsible, status: @tool.status, teaching: @tool.teaching, type: @tool.type, use: @tool.use }
    end

    assert_redirected_to tool_path(assigns(:tool))
  end

  test "should show tool" do
    get :show, id: @tool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tool
    assert_response :success
  end

  test "should update tool" do
    patch :update, id: @tool, tool: { bill: @tool.bill, brand: @tool.brand, extention: @tool.extention, from_set: @tool.from_set, investigation: @tool.investigation, location: @tool.location, management: @tool.management, material: @tool.material, name: @tool.name, national_good: @tool.national_good, responsible: @tool.responsible, status: @tool.status, teaching: @tool.teaching, type: @tool.type, use: @tool.use }
    assert_redirected_to tool_path(assigns(:tool))
  end

  test "should destroy tool" do
    assert_difference('Tool.count', -1) do
      delete :destroy, id: @tool
    end

    assert_redirected_to tools_path
  end
end

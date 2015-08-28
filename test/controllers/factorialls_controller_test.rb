require 'test_helper'

class FactoriallsControllerTest < ActionController::TestCase
  setup do
    @factoriall = factorialls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factorialls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factoriall" do
    assert_difference('Factoriall.count') do
      post :create, factoriall: { n: @factoriall.n, result: @factoriall.result }
    end

    assert_redirected_to factoriall_path(assigns(:factoriall))
  end

  test "should show factoriall" do
    get :show, id: @factoriall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factoriall
    assert_response :success
  end

  test "should update factoriall" do
    patch :update, id: @factoriall, factoriall: { n: @factoriall.n, result: @factoriall.result }
    assert_redirected_to factoriall_path(assigns(:factoriall))
  end

  test "should destroy factoriall" do
    assert_difference('Factoriall.count', -1) do
      delete :destroy, id: @factoriall
    end

    assert_redirected_to factorialls_path
  end
end

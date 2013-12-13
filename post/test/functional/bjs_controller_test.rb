require 'test_helper'

class BjsControllerTest < ActionController::TestCase
  setup do
    @bj = bjs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bjs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bj" do
    assert_difference('Bj.count') do
      post :create, bj: { bj_num: @bj.bj_num, class_name: @bj.class_name }
    end

    assert_redirected_to bj_path(assigns(:bj))
  end

  test "should show bj" do
    get :show, id: @bj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bj
    assert_response :success
  end

  test "should update bj" do
    put :update, id: @bj, bj: { bj_num: @bj.bj_num, class_name: @bj.class_name }
    assert_redirected_to bj_path(assigns(:bj))
  end

  test "should destroy bj" do
    assert_difference('Bj.count', -1) do
      delete :destroy, id: @bj
    end

    assert_redirected_to bjs_path
  end
end

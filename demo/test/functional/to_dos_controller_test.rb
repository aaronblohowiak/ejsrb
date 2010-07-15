require 'test_helper'

class ToDosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:to_dos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create to_do" do
    assert_difference('ToDo.count') do
      post :create, :to_do => { }
    end

    assert_redirected_to to_do_path(assigns(:to_do))
  end

  test "should show to_do" do
    get :show, :id => to_dos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => to_dos(:one).to_param
    assert_response :success
  end

  test "should update to_do" do
    put :update, :id => to_dos(:one).to_param, :to_do => { }
    assert_redirected_to to_do_path(assigns(:to_do))
  end

  test "should destroy to_do" do
    assert_difference('ToDo.count', -1) do
      delete :destroy, :id => to_dos(:one).to_param
    end

    assert_redirected_to to_dos_path
  end
end

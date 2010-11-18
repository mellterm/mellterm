require 'test_helper'

class DocumentStatusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_status" do
    assert_difference('DocumentStatus.count') do
      post :create, :document_status => { }
    end

    assert_redirected_to document_status_path(assigns(:document_status))
  end

  test "should show document_status" do
    get :show, :id => document_statuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => document_statuses(:one).to_param
    assert_response :success
  end

  test "should update document_status" do
    put :update, :id => document_statuses(:one).to_param, :document_status => { }
    assert_redirected_to document_status_path(assigns(:document_status))
  end

  test "should destroy document_status" do
    assert_difference('DocumentStatus.count', -1) do
      delete :destroy, :id => document_statuses(:one).to_param
    end

    assert_redirected_to document_statuses_path
  end
end

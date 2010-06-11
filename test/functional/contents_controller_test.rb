require 'test_helper'

class ContentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Content.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Content.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Content.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to content_url(assigns(:content))
  end
  
  def test_edit
    get :edit, :id => Content.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Content.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Content.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Content.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Content.first
    assert_redirected_to content_url(assigns(:content))
  end
  
  def test_destroy
    content = Content.first
    delete :destroy, :id => content
    assert_redirected_to contents_url
    assert !Content.exists?(content.id)
  end
end

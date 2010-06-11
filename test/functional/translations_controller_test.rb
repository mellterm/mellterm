require 'test_helper'

class TranslationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Translation.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Translation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Translation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to translation_url(assigns(:translation))
  end
  
  def test_edit
    get :edit, :id => Translation.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Translation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Translation.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Translation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Translation.first
    assert_redirected_to translation_url(assigns(:translation))
  end
  
  def test_destroy
    translation = Translation.first
    delete :destroy, :id => translation
    assert_redirected_to translations_url
    assert !Translation.exists?(translation.id)
  end
end

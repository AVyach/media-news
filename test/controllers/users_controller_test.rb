# test/controllers/users_controller_test.rb

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:id] = @user.id
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, params: { user: { name: 'Test User', login: 'testuser', password: 'password123' } }
    end

    assert_redirected_to root_path
  end

  test 'should show user' do
    get :show, params: { id: @user.id }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @user.id }
    assert_response :success
  end

  test 'should update user' do
    patch :update, params: { id: @user.id, user: { name: 'Updated Rider' } }
    assert_response :success
  end

  test 'should authenticate user before accessing edit and update' do
    session[:id] = nil
    get :new
    assert_response :success

    patch :update, params: { id: @user.id, user: { name: 'Updated User' } }
    assert_redirected_to new_session_path
  end
end

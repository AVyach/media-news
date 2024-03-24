require 'test_helper'
class SessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create session for rider' do
    post :new, params: { session: { login: users(:one).login, password: 'password' } }
    assert_response :success
  end


  # Add more tests for other controller actions
end
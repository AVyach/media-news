# test/models/user_test.rb

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(login: 'example_user', password: 'password123')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'login should be at least 5 characters' do
    @user.login = 'abcd'
    assert_not @user.valid?
  end

  test 'password should be at least 5 characters' do
    @user.password = 'abcd'
    assert_not @user.valid?
  end

  test 'login should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'custom error message for login length validation' do
    @user.login = 'abcd'
    assert_not @user.valid?
    assert_equal ['Логин должен быть не менее 5 символов'], @user.errors[:login]
  end

  test 'custom error message for login uniqueness validation' do
    duplicate_user = @user.dup
    @user.save
    duplicate_user.login = @user.login
    assert_not duplicate_user.valid?
    assert_equal ['Такой логин уже используется'], duplicate_user.errors[:login]
  end

  test 'custom error message for password length validation' do
    @user.password = 'abcd'
    assert_not @user.valid?
    assert_equal ['Пароль должен быть не менее 5 символов'], @user.errors[:password]
  end
end

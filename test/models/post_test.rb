# test/models/post_test.rb

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    post = Post.new(title: 'Valid Title')
    assert post.valid?
  end

  test 'should not be valid without a title' do
    post = Post.new(title: '')
    assert_not post.valid?
    assert_equal ["Заголовок должен быть указан", "Заголовок должен содержать не менее 5 символов"], post.errors[:title]
  end

  test 'should not be valid with a short title' do
    post = Post.new(title: 'Sho')
    assert_not post.valid?
    assert_equal ['Заголовок должен содержать не менее 5 символов'], post.errors[:title]
  end

  test 'should be valid with a title of minimum length' do
    post = Post.new(title: 'Valid')
    assert post.valid?
  end

  test 'should be valid with a long title' do
    post = Post.new(title: 'A' * 100)
    assert post.valid?
  end

  test 'should have many comments' do
    association = Post.reflect_on_association(:comments)
    assert_equal :has_many, association.macro
  end
end

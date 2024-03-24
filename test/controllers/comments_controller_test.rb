# test/controllers/comments_controller_test.rb

require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:id] = @user.id
    @post = posts(:one)
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post :create, params: { post_id: @post.id, comment: { body: 'Test Comment' } }
    end

    assert_redirected_to post_path(@post)
  end

  test 'should not create comment with empty body' do
    assert_no_difference('Comment.count') do
      post :create, params: { post_id: @post.id, comment: { body: '' } }
    end

    assert_redirected_to post_path(@post)
  end

  test 'should redirect to new_session_path if not authenticated' do
    session[:id] = nil
    post :create, params: { post_id: @post.id, comment: { body: 'Test Comment' } }

    assert_redirected_to new_session_path
  end



  private

  def comment_params
    { body: 'Test Comment' }
  end
end

class PostsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:user] = 1
    session[:id] = @user.id

    # Добавим создание поста для использования в тестах
    @post = posts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should show post' do
    get :show, params: { id: @post.id } # Используем @post вместо posts(:one).id
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @post.id }
    assert_response :success
  end

  test 'should update post' do
    put :update, params: { id: @post.id, post: { name: 'Updated Post' } } # Используем @post.id вместо posts(:one).id
    assert_redirected_to post_path(assigns(:post))
  end

  test 'should not create post with invalid params' do
    assert_no_difference('Post.count') do
      post :create, params: { post: { name: nil } }
    end
    assert_template :new
  end

end

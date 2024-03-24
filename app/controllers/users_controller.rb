class UsersController < ApplicationController

  before_action :authenticate_user, except: [:new,:create,:user_params]
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :login, :password)

    User.create(user_params)
    redirect_to root_path
  end

  def show
    @user = User.find_by(id: session[:id])
    @posts = Post.all
  end

  def edit
    @user = User.find_by(id: session[:id])
  end

  def update
    @user = User.find_by(id: session[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      puts @user.errors.full_messages
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :login, :password)
    # params[:name] = @name
  end

  def authenticate_user
    unless current_user.present?
      redirect_to new_session_path
    end
  end
end

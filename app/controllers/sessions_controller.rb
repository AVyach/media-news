class SessionsController < ApplicationController

  def new

  end

  def create
    user_params = params.require(:session)
    if User.find_by(login: user_params[:login]).present?
      user = User.find_by(login: user_params[:login])
      if user_params[:password] == user.password
      session[:id] = user.id
      redirect_to root_path
      else
      redirect_to new_session_path
      end
    else redirect_to new_session_path
    end
    end

  def destroy
    session.delete(:id)
    redirect_to root_path
  end

end

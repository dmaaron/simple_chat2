class SessionsController < ApplicationController
  def new
    puts session
  end

  def create
    user = User.find_by_username(params[:username])
    puts 'located user:' + user.username
    authenticated_user =  user.authenticate(params[:password])
    if authenticated_user
      session['user_id'] = authenticated_user.id
      message = 'You are authenticated!'
      redirect_to root_path
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session[:user_id] = nil
    p session
    redirect_to sessions_new_path
  end
end
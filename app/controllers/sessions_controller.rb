class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(first_name: params[:user][:first_name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = "Login failed"
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end

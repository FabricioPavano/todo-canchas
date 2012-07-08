class SessionsController < ApplicationController

  def new
    render layout: 'auth'
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :log_in, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new", layout: 'auth'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :log_in, :notice => "Logged out!"
  end
end



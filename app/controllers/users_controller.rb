class UsersController < ApplicationController
  def new
    @user = User.new
    render :layout => 'auth'
  end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Ingresaste!"
  else
    render "new"
  end

end
end

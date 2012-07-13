class PasswordResetsController < ApplicationController
  def new
    render layout: 'auth'
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to :log_in, :notice => "Email sent with password reset instructions."
  end
end

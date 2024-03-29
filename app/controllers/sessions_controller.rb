class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to @user
    else
      flash.now[:error] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    signout
    redirect_to root_path
  end

end

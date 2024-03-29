class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :followers, :following]  
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy]

  def new
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome #{@user.name} to sample app"
        redirect_to @user
      else
        render 'new'
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in user
      redirect_to user
    else
      render 'edit'
    end  
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
end

class UsersController < ApplicationController

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end
  
  def mypage
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  # def destroy
  #   session.delete(:user_id)
  #   flash[:notice] = 'ログアウトしました'
  #   redirect_to new_session_path
  # end

  private
  def user_params
    params.require(:user).permit(:name, :email, :icon)
  end
end

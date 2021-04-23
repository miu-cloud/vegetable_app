class UsersController < ApplicationController
  before_action :set_q, only: [:mypage, :search]

  def index
    @users = User.all
    # @user = User.find(params[:id])
  end
  
  def mypage
    @user = current_user
    @users = User.all
    @results = @q.result
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



  # def search
  #   @results = @q.result
  # end

  private
  def set_q
    @q = User.ransack(params[:q])
  end

  def user_params
    params.require(:user).permit(:name, :email, :icon)
  end



end

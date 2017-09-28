class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render :show
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :email, :city)
  end
end

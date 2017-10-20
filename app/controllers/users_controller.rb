class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]

  def action
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to @user }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'users/show' }
        format.js
      end
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

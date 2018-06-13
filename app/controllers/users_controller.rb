class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update, :destroy]

  def action
    redirect_to current_user
  end

  def show
    @places = Place.all
    @assos = Asso.all
    @artists = Artist.all
    @place = Place.new
    @asso = Asso.new
    @artist = Artist.new
    @topic = Topic.new
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

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :email, :city)
  end
end

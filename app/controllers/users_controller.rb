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
    @topics = Topic.all
    @contact = Contact.all
    @releases = Release.all
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
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
    params.require(:user).permit(:email, :production, genre_ids:[], instrument_ids:[], county_ids:[], activity_ids:[])
  end
end

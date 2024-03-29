class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_one :artist, dependent: :destroy
  has_one :asso, dependent: :destroy
  has_one :place, dependent: :destroy
  has_many :topics
  has_many :comments
  has_many :contacts
  has_many :artists, through: :contacts
  has_many :messages
  has_many :artists, through: :messages
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :instrument_playings
  has_many :instruments, through: :instrument_playings
  has_many :user_counties
  has_many :counties, through: :user_counties
  has_many :activities, through: :user_activities
  has_many :user_activities

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image


    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  private

    def welcome
      UserMailer.welcome(self).deliver_now
    end

  # [...]
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :label]

  def home
  end
end

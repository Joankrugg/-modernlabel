class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :label]

  def home
  end

  def label
  end
end

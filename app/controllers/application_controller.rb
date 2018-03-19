class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_locale

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

end

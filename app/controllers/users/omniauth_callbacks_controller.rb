class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook

    auth = env["omniauth.auth"]
    user = User.find(env['omniauth.params']['user_id'])

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end

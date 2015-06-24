class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    data = request.env['omniauth.auth']
    if data.info['email'] =~ /@smashingboxes\.com$/
      @user = User.find_or_create_for_google_oauth2(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    else
      flash[:error] = 'Must be @smashingboxes google account'
      redirect_to root_path
    end
  end
end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def discord
        @user = User.from_omniauth(request.env['omniauth.auth'])
        sign_in_and_redirect @user, event: :authentication
    end

    def failure
        flash[:error] = 'Login failed'
        redirect_to root_path
    end
end

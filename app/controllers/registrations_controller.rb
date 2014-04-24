class RegistrationsController < Devise::RegistrationsController

def sign_up_params
     params.require(:user).permit(:email, :username, :password)
end

  private
  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end

end
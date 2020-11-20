class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username email password remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name username email password current_password remember_me])
  end
end

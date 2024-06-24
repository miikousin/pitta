class ApplicationController < ActionController::Base
  before_action :configure_parmitted_parameters, if: :devise_controller?

  private
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :age_id, :gender_id, :height, :weight])
  end
end

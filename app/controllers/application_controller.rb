class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]
  before_action :update_allowed_parameters, if: :devise_controller?
  load_and_authorize_resource unless: :devise_controller?

  def after_sign_in_path_for(resource)
    resource.categories
    user_categories_path(user_id: current_user.id)
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :password, :current_password)
    end
  end
end

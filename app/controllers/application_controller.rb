class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier

  def after_sign_in_path_for(resource)
    # if current_user.has_role?(:admin)
    #   dashboard_path
    # elsif current_user.has_role?(:student)
    #   root_path
    # else
    #   some_other_path || root_path
    # end
    root_path
  end

  before_action :configure_permitted_paramters, if: :devise_controller?

  protected
    def configure_permitted_paramters
        #devise_parameter_sanitizer.permit(:edit, keys: [:first_name,:last_name,:phone_number,:email, :password, :avatar])
        devise_parameter_sanitizer.permit(:edit) { |u| u.permit({ roles: [] }, :first_name,:last_name,:phone_number,:email, :password, :avatar)}
        devise_parameter_sanitizer.permit(:update) { |u| u.permit({ roles: [] }, :first_name,:last_name,:phone_number,:email, :password, :avatar)}
    end


end

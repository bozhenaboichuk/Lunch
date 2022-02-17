# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier
  include Authorization

  def account_update(resource, params)
    resource.update_without_password(params)
  end

  before_action :authenticate_user!
  before_action :configure_permitted_paramters, if: :devise_controller?

  protected

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number email password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name phone_number email password avatar])
  end
end

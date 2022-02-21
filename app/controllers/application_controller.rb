class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier
  include Authorization

  def account_update(resource, params)
    resource.update_without_password(params)
  end

  before_action :authenticate_user!
  before_action :set_locale
  before_action :configure_permitted_paramters, if: :devise_controller?


  def set_locale(&action)
    if user_signed_in?
      I18n.locale = current_user.locale
    else
      I18n.locale =  I18n.default_locale
    end
  end

  protected

    def configure_permitted_paramters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:phone_number,:email, :password, :locale])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:phone_number,:email, :password, :avatar, :locale])
    end
end

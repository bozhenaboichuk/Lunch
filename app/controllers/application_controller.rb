class ApplicationController < ActionController::Base
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
end

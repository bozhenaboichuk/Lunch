# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      alert = 'You are not authorized to perform this action!'
      redirect_to(request.referer || root_path, alert: alert, status: :see_other)
    end
  end
end

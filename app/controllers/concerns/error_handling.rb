# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  included do
    
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

    private

    def not_found_error
      alert = 'Record with such id not found!'
      redirect_to request.referer || root_path, alert: alert, status: :see_other
    end
  end
end

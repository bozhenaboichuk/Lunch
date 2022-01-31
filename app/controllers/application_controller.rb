class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier
  include Authorization
end

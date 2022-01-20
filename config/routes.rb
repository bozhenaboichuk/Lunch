Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  root "restaurants#index"
end

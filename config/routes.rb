Rails.application.routes.draw do
  devise_for :users
  devise_for :views

  resources :restaurants do
    resources :dishes
  end

  resources :line_items

  resources :orders

  root "restaurants#index"
end

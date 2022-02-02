Rails.application.routes.draw do


  devise_for :users

  resources :users
  resources :admin_users

  devise_for :views

  resources :restaurants do
    resources :dishes
  end

  resources :line_items

  resources :orders

  root "restaurants#index"

  scope "admin" do
    get "users", to: "users#index"
    delete "users/:id", to: "users#destroy"
  end

end

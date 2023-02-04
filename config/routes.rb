# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :views

  resources :users do
    resources :orders do
      resources :line_items
    end
  end

  resources :orders, only: %i[index] do
    resources :line_items
  end

  patch 'orders', to: 'orders#update'

  resources :admin_users

  scope 'admin' do
    get 'users', to: 'users#index'
    delete 'users/:id', to: 'users#destroy'
  end

  resources :restaurants do
    resources :dishes
  end

  root 'restaurants#index'
end

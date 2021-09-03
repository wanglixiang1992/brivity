# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: %i[index new create show] do
    resources :comments, only: %i[create]
  end

  root to: 'posts#index'
end

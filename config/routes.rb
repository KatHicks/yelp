Rails.application.routes.draw do


  devise_for :users, :controllers =>{ :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :restaurants do
    resources :reviews
  end

  root 'restaurants#index'
end

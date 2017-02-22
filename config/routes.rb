Rails.application.routes.draw do
  root "restaurant#index"
  devise_for :users
  resources :restaurants do
    resources :reviews
  end
end

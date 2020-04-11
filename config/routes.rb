Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" } do

  end
  root to: 'pages#home'

  resources :listings

  resources :profiles, only: [:new, :create]
end

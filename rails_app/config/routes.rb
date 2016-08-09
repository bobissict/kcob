Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'profiles#index'

  resources :profiles
end

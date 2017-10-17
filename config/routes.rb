Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'tracks#new'
  resources :tracks
  resources :wallets, only: [:show]
  get '/terms_and_privacy', to: 'site#terms_and_privacy'
  get '/summary/:id', to: 'tracks#summary'
  get '/:id', to: 'tracks#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

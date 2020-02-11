Rails.application.routes.draw do
  devise_for :users
  root to: "public#index"

  get 'dashboard', to: 'users#dashboard'
end

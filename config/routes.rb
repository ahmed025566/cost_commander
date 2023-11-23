Rails.application.routes.draw do
  devise_for :users 
  
  root "public#home"
  resources :groups, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:new, :create]
  end
end

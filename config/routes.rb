Rails.application.routes.draw do

  devise_for :users

  resources :categories, only: [:index, :create] do 
  	resources :products
  end

  root 'categories#index'
end

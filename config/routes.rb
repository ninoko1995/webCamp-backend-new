Rails.application.routes.draw do
	devise_for :users
  
  resources :users,only: [:show,:edit,:update,:index] do
  	resources :favorites,only:[:index]
  	resource :relationships, only: [:create, :destroy]
	  member do
	  	get :follows
	  	get :followers
	  end
  end

  resources :books do
  	resource :favorites,only:[:create,:destroy]
  end
  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

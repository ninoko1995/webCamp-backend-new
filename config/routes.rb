Rails.application.routes.draw do
	devise_for :users
  
  resources :users,only: [:show,:edit,:update,:index] do
  	resources :favorites,only:[:index]
  	resources :relationships, only: [:create, :destroy] do
      member do
        get :accept
      end
    end
    
	  member do
	  	get :follows
	  	get :followers
      get :requires
	  end

    #timeline実装用のrouting
    # collection do
    #   get :home
    # end
  end

  resources :books do
  	resource :favorites,only:[:create,:destroy]
    resources :comments,only: [:create,:destroy]
    member do
      get :favors
    end
  end
  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

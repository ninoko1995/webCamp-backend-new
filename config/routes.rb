Rails.application.routes.draw do

	devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions',
 :passwords => 'users/passwords'
}
  
  resources :users,only: [:show,:edit,:update,:index] do
  	resources :relationships, only: [:create, :destroy] do
      member do
        get :accept
      end
    end
    
	  member do
	  	get :follows
	  	get :followers
      get :requires
      get :favorites
	  end

    collection do
      get :home
    end

  end


  resources :books do
  	resource :favorites,only:[:create,:destroy]
    resources :comments,only: [:create,:destroy]
    member do
      get :favors
    end
  end
  
  # 本の種類に関しての機能
  resources :interests,only: [:create,:destroy] do
    collection do
      post :search
    end
  end

  resources :book_types,only: [:destroy] do
    collection do
      post :search
    end
  end


  # ログイン前の画面のルーティング
  root 'home#top'
  get 'about'=>'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  resources :cycles
  resources :cycles
  resources :cycles
  devise_for :users,:controllers => { :registrations => "user/registrations"}

  #devise_scope :user do
   #get "Sign up", to: "devise/registrations#new"
   #get "Log in", to: "devise/sessions#new"
   #get "Log out", to: "devise/sessions#destroy"
   #match '/sessions.user', to: 'devise/sessions#create' , via: :post
  #end
  get 'list_bookings', to: 'bookings#list'
  resources :bookings, only: [:create, :destroy]
  resources :cycles
  get 'search_bookings', to: 'bookings#search'
  get 'search_store_bikes', to: 'store_bikes#search'
 # get 'welcome/index'
 # get 'search_store_bikes', to: 'storebikes#search'
  resources :welcome
  root to: 'welcome#index' 

  get 'my_profile', to: 'users#my_profile'
  resources :users
  resources :bikes
  resources :stores
  resources :pages

	
  resources :stores do  
   resources :store_bikes do  
     resources :bookings  
    end  
  end
 
 resources :user_bookings, only: [:create, :destroy]
  
 get '/search' => 'pages#search', :as => 'search_page'

end

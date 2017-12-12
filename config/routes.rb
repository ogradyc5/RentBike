Rails.application.routes.draw do
  
  devise_for :users

  #devise_scope :user do
   #get "Sign up", to: "devise/registrations#new"
   #get "Log in", to: "devise/sessions#new"
   #get "Log out", to: "devise/sessions#destroy"
   #match '/sessions.user', to: 'devise/sessions#create' , via: :post
  #end

  get 'welcome/index'
  resources :welcome
  root to: 'welcome#index' 

  get 'users/my_profile'
  resources :users
  resources :bikes
  resources :stores
  resources :pages

	
 resources :stores do  
   resources :store_bikes do  
     resources :bookings  
    end  
  end
 
 
  
  get '/search' => 'pages#search', :as => 'search_page'

end

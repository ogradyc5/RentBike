Rails.application.routes.draw do
  
  devise_for :users
  #, controllers: { registrations: "registrations" }
  #resources :
  devise_scope :user do
   get "Sign up", to: "devise/registrations#new"
   get "Log in", to: "devise/sessions#new"
   get "Log out", to: "devise/sessions#destroy"
   match '/sessions.user', to: 'devise/sessions#create' , via: :post
   #post 'account/login' => 'account#login_user', :as => :session
  end

  get 'welcome/index'
  resources :welcome
  root to: 'welcome#index' 

  #get "/store_bikes" => "store_bikes#index"
  get 'users/my_profile'
  resources :users
  #root to: 'users#my_profile'
  
  resources :bikes
  resources :stores
  resources :pages
  #resources :rent_bikes do
	 # resources :bookings
#	end
  #resources :stores do
#	  resources :bookings
#	end
	
	
 resources :stores do  
   resources :store_bikes do  
     resources :bookings  
    end  
  end
 
 
  
  get '/search' => 'pages#search', :as => 'search_page'
#resources :bookings
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  #resources :layouts
  #resources :sessions, only: [:new, :create, :destroy]
  
  #root to: "devise#index"
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

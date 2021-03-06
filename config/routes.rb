Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'suggestions#index'

  #get '/auth/:provider' => 'sessions#new'
  get "/auth/:provider/callback" => "sessions#create"

  post '/suggestions' => "suggestions#search_term", as: :search_term
  delete "/logout" => "sessions#destroy"

  get '/suggestions/favorites' => "suggestions#favorites"
  post '/suggestions/favorites' => "suggestions#favorite"
  delete 'suggestions/favorites/:suggestion_id' => "suggestions#unfavorite", as: :unfavorite
  #get '/users/:user_id/favorites' => "suggestions#favorites", as: :user_favorites
  # post '/users/:user_id/favorites' => "suggestions#favorite"


  # resources :sessions, :only => [:create]
  #get "/sign_in" => "sessions#new"
  #delete "/sign_out" => "sessions#destroy"

  # resources :suggestions, :except => [:index, :create]




  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

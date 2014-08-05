require 'resque/server'
HelpLine::Application.routes.draw do
  mount Resque::Server, :at => "/resque"
  root 'welcome#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with 'rake routes".
  get 'sign-in',        to: 'welcome#home'
  post '/sign_in',      to: 'welcome#sign_in', as: :sign_in
  post '/sign_out',     to: 'welcome#sign_out', as: :sign_out

  get '/sign_up',       to: 'adies#new', as: :sign_up
  post '/sign_up',      to: 'adies#create', as: :add_adie # make only admin accessible?

  get '/analysis',      to: 'problems#analysis'
  get '/adies',         to: 'adies#index'

  get '/help_me',       to:  'problems#new'
  post '/help_me',      to:  'problems#create', as: :new_problem
  get '/problems',      to:  'problems#index', as: :problems
  get '/problems/:id',  to: 'problems#show', as: :problem
  post '/ratings/new',  to: 'ratings#create', as: :ratings
  post '/problems/:id', to: 'problems#update', as: :helped

  get '/profile',       to: 'adies#show', as: :profile
  patch '/profile',     to:'adies#update', as: :set_profile
  patch '/reset',       to: 'adies#new_password', as: :forgot_password

  
      

  # resources :problems

  # You can have the root of your site routed with 'root'
  # root 'welcome#index'

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

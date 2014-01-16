HelpLine::Application.routes.draw do
  root 'welcome#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'sign-in'         => 'welcome#home'
  post "/sign_in"       => 'welcome#sign_in', as: :sign_in
  post "/sign_out"      => 'welcome#sign_out', as: :sign_out

  get "/sign_up"        => "adies#new", as: :sign_up
  post "/sign_up"       => "adies#create", as: :add_adie # make only admin accessible?

  get '/analysis'       => 'problems#analysis'
  get '/adies'          => 'adies#index'

  get '/help_me'        => 'problems#new'
  post '/help_me'       => 'problems#create', as: :new_problem
  get '/problems'       => 'problems#index'
  post "/problems/:id"  => "problems#update", as: :helped

  get '/profile'        => 'adies#show', as: :profile
  patch '/profile'      => 'adies#update', as: :reset_password
      

  # resources :problems

  # You can have the root of your site routed with "root"
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

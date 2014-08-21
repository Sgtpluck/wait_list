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

  get '/status',        to: 'status#index'
end

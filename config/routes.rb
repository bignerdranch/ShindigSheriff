ShindigSheriff::Application.routes.draw do

  resources :organizations

  get "organizations/new"
  get "organizations/edit"
  get "organizations/show"
  devise_for :users

  resources :users do  
    resources :organizations
  end

  root to: 'users#new'

end


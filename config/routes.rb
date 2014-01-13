ShindigSheriff::Application.routes.draw do

  devise_for :users

  resources :users do  
    resources :organizations
  end

  root to: 'users#new'

end
ShindigSheriff::Application.routes.draw do

  resources :organizations

  devise_for :users

  resources :users do  
    resources :organizations
  end

  root to: 'users#new'

end


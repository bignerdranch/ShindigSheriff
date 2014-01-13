ShindigSheriff::Application.routes.draw do

  resources :users do  
    resources :organizations
  end

  root to: 'users#new'

end
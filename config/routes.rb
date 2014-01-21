ShindigSheriff::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => 'users#show', as: :dashboard
    end
    unauthenticated :user do
      root :to => 'users#new', as: :sign_in
    end
  end

  resources :users, only: [:show, :new, :create] do  
    resources :organizations
  end
  
  scope shallow_prefix: "sekret" do
    resources :organizations do
      resources :events, shallow: true
      get '/finance_approver', to: 'organizations#financeapprover'
      put '/finance_approver', to: 'organizations#add_financeapprover'
    end
  end

  resources :events, only: [] do
    resources :incomes, only: [:new, :create]
  end

end


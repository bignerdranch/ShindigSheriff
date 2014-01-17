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

  resources :users do  
    resources :organizations
  end
  
  scope shallow_prefix: "sekret" do
    resources :organizations do
      resources :events, shallow: true
      resources :finance_approvers, only: [:new, :create], shallow: true
    end
  end

  resources :events, only: [] do
    resources :incomes, only: [:index, :new, :create]
  end

end


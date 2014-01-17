ShindigSheriff::Application.routes.draw do

  devise_for :users

  resources :users do  
    resources :organizations
  end
  
  scope shallow_prefix: "sekret" do
    resources :organizations do
      resources :events, shallow: true
      resources :finance_approvers, only: [:new, :create], shallow: true
  end

  resources :events, only: [] do
    resources :incomes, only: [:index, :new, :create]
  end

 
end

  root to: 'users#new'

end


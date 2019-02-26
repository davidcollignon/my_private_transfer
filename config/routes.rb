Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "pages/index", to: "pages#index"

  get "/dashboard", to: "users#dashboard"
  get "/dashboard/revenues", to: "users#revenues"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :services do
      resources :payments, only: [:new, :create]
    end
  end
end

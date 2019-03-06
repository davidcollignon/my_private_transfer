Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pages/index', to: "pages#index"
  get "/dashboard", to: "users#dashboard"
  get "/dashboard/revenues", to: "users#revenues"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :services do
    member do
      get 'confirm'
    end
    member do
      patch 'confirm_update'
    end
    resources :payments, only: [:new, :create]
    member do
       get 'send_invoice_email_client'
    end
  end
end
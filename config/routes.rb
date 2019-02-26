Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  devise_for :users
  root to: 'pages#home'
  get "pages/index", to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

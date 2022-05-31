Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  resources :activities do
    resources :reviews, only: [:create, :new] do
      resources :reservations, only: :create
    end


  end

  resources :reviews, only: :destroy
  resources :reservations, only: :destroy
end

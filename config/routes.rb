Rails.application.routes.draw do
  devise_for :users
  # get 'exchanges/index'
  # get 'exchanges/new'
  # get 'categories/index'
  # get 'categories/new'
  # root 'splash_screen/index'
  #   authenticated :user do
  #   root "categories#index", as: :authenticated_root
  # end

  # unauthenticated do
  #   root "splash_screen#index", as: :unauthenticated_root
  # end
   

  resources :categories do
    resources :exchanges
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "categories#index"
end

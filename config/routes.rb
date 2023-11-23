Rails.application.routes.draw do
  devise_for :users
  # get 'exchanges/index'
  # get 'exchanges/new'
  # get 'categories/index'
  # get 'categories/new'
  # root 'splash_screen/index'
    authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  unauthenticated do
    root "splash_screen#index", as: :unauthenticated_root
  end
   

 resources :categories do
  resources :exchanges
end
  get "up" => "rails/health#show", as: :rails_health_check
end

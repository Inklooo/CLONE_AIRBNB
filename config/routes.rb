Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cottages do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy, :edit, :update]

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

  get 'accept/:id', to: 'bookings#edit_accept', as: 'accept_booking'
  get 'refuse/:id', to: 'bookings#edit_refuse', as: 'refuse_booking'



  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

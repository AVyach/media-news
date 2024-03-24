Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index" #отображение главной страницы
  get 'about' => 'pages#about', as: 'about' #отображение страницы об авторе
  resource :session
  resources :posts
  resources :pages
  resources :users
  post '/change_language', to: 'application#change_language'

  resources :posts do 
    resources :comments #добавление url внутри другого
  end
end

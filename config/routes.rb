Rails.application.routes.draw do
  # get 'users/upload'
  # 
  resources :users

  post 'users/upload', to: 'users#upload' 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

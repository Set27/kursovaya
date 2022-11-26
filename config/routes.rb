Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "wanted_lists#index"

  get '/rozysk', to: 'wanted_lists#index'

  resources :wanted_lists
  resources :car_infos, expect: :show
end

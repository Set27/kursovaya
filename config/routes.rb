Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: redirect("/wanted_lists")

  resources :wanted_lists
  resources :car_infos, except: :show do
    member do
      get :registation_infos
    end
  end

  resources :car_holder_infos
  resources :registation_infos
  resources :fines do
    member do
      get :payment_form
      post :payment
    end
  end
  resources :car_complaints

  resources :users, only: %i(index edit update)
end

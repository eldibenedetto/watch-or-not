Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :create, :show]
      resources :users, only: [:index, :create, :show]
      resources :user_movies, only: [:index, :create, :show]
      resources :sessions, only: [:create]
    end
  end
end

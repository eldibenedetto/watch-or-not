Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :notes, only: [:index, :create]
      resources :movies, only: [:index, :create]
      resources :users, only: [:index, :create, :show]
      resources :user_movies, only: [:index, :create, :show]
    end
  end
end

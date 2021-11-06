Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :apartments, only: %i[index show create]
      resources :users, only: %i[ show create]
      resources :login, only: %i[create]
      resources :auto_login, only: %i[create]
    end
  end
end

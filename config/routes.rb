Rails.application.routes.draw do
  get 'login/create'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # resources :users, only: %i[show create]
      resources :apartments, only: %i[index show create]
    end
  end
end

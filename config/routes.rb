Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create, :destroy] do
        collection do
          post :sign_in, controller: :sessions, action: :create
        end
      end

      scope module: :users do
        resources :users do
          resources :notes, only: [:index, :create, :update, :destroy]
        end
      end
    end
  end
end

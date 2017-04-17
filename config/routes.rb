Rails.application.routes.draw do
  root 'home#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :links do
        get '/top_ten', to: 'top_ten#index'  
      end

      resources :links, only: [:create]
    end
  end
end

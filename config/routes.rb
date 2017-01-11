Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :healths, only: [:index]
      resources :users, only: [:index]
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'

end

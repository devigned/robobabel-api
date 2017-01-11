Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'health', to: 'health#index'
    end
  end

end

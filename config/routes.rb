Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {registrations: 'registrations', sessions: 'sessions', unlocks: 'unlocks'}

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'health', to: 'health#index'
    end
  end

end

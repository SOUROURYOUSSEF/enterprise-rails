Api::Engine.routes.draw do

#  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do

    namespace :v1, defaults: { format: :json } do
        devise_for :users
         # We are going to list our resources here
        resources :users, :only => [:show, :index]
        resources :groups, :only => [:show, :index]

        devise_scope :user do
            resources :users do
                get 'verify_mobile', to: 'registrations#verify_mobile', as: 'verify_mobile', on: :member
                get 'update_password', to: 'registrations#update_password', as: 'update_mobile', on: :member
            end
        end
    end
end

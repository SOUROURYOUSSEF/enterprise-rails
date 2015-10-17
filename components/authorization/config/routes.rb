Authorization::Engine.routes.draw do

  namespace :authorize_it do
    resources :operations do
      get 'delete', on: :member
    end
    resources :application_class do
      get 'delete', on: :member
    end
    resources :application_scope do
      get 'delete', on: :member
    end
    resources :permissions do
      get 'delete', on: :member
    end
    resources :roles do
      get 'delete', on: :member
    end
    resources :groups do
      get 'delete', on: :member
    end
    resources :users do
      get 'delete', on: :member
    end
  end

  root 'authorize_it/users#index'

end

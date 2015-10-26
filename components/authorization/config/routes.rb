Authorization::Engine.routes.draw do

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
      get 'manage_membership', on: :member
    end
    resources :users do
      get 'delete', on: :member
    end

  root 'users#index'

end

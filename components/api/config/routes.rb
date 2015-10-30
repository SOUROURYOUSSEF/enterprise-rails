Api::Engine.routes.draw do

#  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do

  namespace :v1, defaults: { format: :json } do
       # We are going to list our resources here
      resources :users, :only => [:show, :index]
      resources :groups, :only => [:show, :index]
  end

end

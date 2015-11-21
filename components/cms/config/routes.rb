Cms::Engine.routes.draw do

  resources :cms do
    get 'retrieve', on: :collection
  end

end

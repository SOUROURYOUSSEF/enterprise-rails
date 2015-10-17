Authentication::Engine.routes.draw do

  devise_for :users, module: :devise

end

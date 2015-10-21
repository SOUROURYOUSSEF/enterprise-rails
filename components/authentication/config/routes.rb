Authentication::Engine.routes.draw do

      #devise_for :users, module: 'devise', :controllers => {:registrations => "authentication/registrations"}

  devise_for :users, module: 'devise'

end

# == Route Map
#
# [:::[34m2015-11-20T20:49:45[0m] DEBUG [36mActiveRecord::Base[0m : [35m  [1m[36m (0.6ms)[0m  [1mSELECT COUNT(*) FROM "users"[0m[0m
# [:::[34m2015-11-20T20:49:45[0m] DEBUG [36mActiveRecord::Base[0m : [35m  [1m[35m (0.3ms)[0m  SELECT COUNT(*) FROM "roles"[0m
# [:::[34m2015-11-20T20:49:45[0m] DEBUG [36mActiveRecord::Base[0m : [35m  [1m[36m (0.3ms)[0m  [1mSELECT COUNT(*) FROM "groups"[0m[0m
#             Prefix Verb URI Pattern Controller#Action
# persistence_engine      /           Persistence::Engine
#     authentication      /           Authentication::Engine
#      authorization      /           Authorization::Engine
#                api      /api        Api::Engine
#          web_style      /           WebStyle::Engine
#        sample_data      /           SampleData::Engine
#             search      /           Search::Engine
#               jobs      /           Jobs::Engine
#                cms      /           Cms::Engine
#
# Routes for Persistence::Engine:
#
#
# Routes for Authentication::Engine:
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#
# Routes for Authorization::Engine:
#         delete_operation GET    /operations/:id/delete(.:format)        authorization/operations#delete
#               operations GET    /operations(.:format)                   authorization/operations#index
#                          POST   /operations(.:format)                   authorization/operations#create
#            new_operation GET    /operations/new(.:format)               authorization/operations#new
#           edit_operation GET    /operations/:id/edit(.:format)          authorization/operations#edit
#                operation GET    /operations/:id(.:format)               authorization/operations#show
#                          PATCH  /operations/:id(.:format)               authorization/operations#update
#                          PUT    /operations/:id(.:format)               authorization/operations#update
#                          DELETE /operations/:id(.:format)               authorization/operations#destroy
# delete_application_class GET    /application_class/:id/delete(.:format) authorization/application_class#delete
#  application_class_index GET    /application_class(.:format)            authorization/application_class#index
#                          POST   /application_class(.:format)            authorization/application_class#create
#    new_application_class GET    /application_class/new(.:format)        authorization/application_class#new
#   edit_application_class GET    /application_class/:id/edit(.:format)   authorization/application_class#edit
#        application_class GET    /application_class/:id(.:format)        authorization/application_class#show
#                          PATCH  /application_class/:id(.:format)        authorization/application_class#update
#                          PUT    /application_class/:id(.:format)        authorization/application_class#update
#                          DELETE /application_class/:id(.:format)        authorization/application_class#destroy
# delete_application_scope GET    /application_scope/:id/delete(.:format) authorization/application_scope#delete
#  application_scope_index GET    /application_scope(.:format)            authorization/application_scope#index
#                          POST   /application_scope(.:format)            authorization/application_scope#create
#    new_application_scope GET    /application_scope/new(.:format)        authorization/application_scope#new
#   edit_application_scope GET    /application_scope/:id/edit(.:format)   authorization/application_scope#edit
#        application_scope GET    /application_scope/:id(.:format)        authorization/application_scope#show
#                          PATCH  /application_scope/:id(.:format)        authorization/application_scope#update
#                          PUT    /application_scope/:id(.:format)        authorization/application_scope#update
#                          DELETE /application_scope/:id(.:format)        authorization/application_scope#destroy
#        delete_permission GET    /permissions/:id/delete(.:format)       authorization/permissions#delete
#              permissions GET    /permissions(.:format)                  authorization/permissions#index
#                          POST   /permissions(.:format)                  authorization/permissions#create
#           new_permission GET    /permissions/new(.:format)              authorization/permissions#new
#          edit_permission GET    /permissions/:id/edit(.:format)         authorization/permissions#edit
#               permission GET    /permissions/:id(.:format)              authorization/permissions#show
#                          PATCH  /permissions/:id(.:format)              authorization/permissions#update
#                          PUT    /permissions/:id(.:format)              authorization/permissions#update
#                          DELETE /permissions/:id(.:format)              authorization/permissions#destroy
#              delete_role GET    /roles/:id/delete(.:format)             authorization/roles#delete
#                    roles GET    /roles(.:format)                        authorization/roles#index
#                          POST   /roles(.:format)                        authorization/roles#create
#                 new_role GET    /roles/new(.:format)                    authorization/roles#new
#                edit_role GET    /roles/:id/edit(.:format)               authorization/roles#edit
#                     role GET    /roles/:id(.:format)                    authorization/roles#show
#                          PATCH  /roles/:id(.:format)                    authorization/roles#update
#                          PUT    /roles/:id(.:format)                    authorization/roles#update
#                          DELETE /roles/:id(.:format)                    authorization/roles#destroy
#             delete_group GET    /groups/:id/delete(.:format)            authorization/groups#delete
#  manage_membership_group GET    /groups/:id/manage_membership(.:format) authorization/groups#manage_membership
#  update_membership_group PUT    /groups/:id/update_membership(.:format) authorization/groups#update_membership
#                   groups GET    /groups(.:format)                       authorization/groups#index
#                          POST   /groups(.:format)                       authorization/groups#create
#                new_group GET    /groups/new(.:format)                   authorization/groups#new
#               edit_group GET    /groups/:id/edit(.:format)              authorization/groups#edit
#                    group GET    /groups/:id(.:format)                   authorization/groups#show
#                          PATCH  /groups/:id(.:format)                   authorization/groups#update
#                          PUT    /groups/:id(.:format)                   authorization/groups#update
#                          DELETE /groups/:id(.:format)                   authorization/groups#destroy
#              delete_user GET    /users/:id/delete(.:format)             authorization/users#delete
#                    users GET    /users(.:format)                        authorization/users#index
#                          POST   /users(.:format)                        authorization/users#create
#                 new_user GET    /users/new(.:format)                    authorization/users#new
#                edit_user GET    /users/:id/edit(.:format)               authorization/users#edit
#                     user GET    /users/:id(.:format)                    authorization/users#show
#                          PATCH  /users/:id(.:format)                    authorization/users#update
#                          PUT    /users/:id(.:format)                    authorization/users#update
#                          DELETE /users/:id(.:format)                    authorization/users#destroy
#                     root GET    /                                       authorization/users#index
#
# Routes for Api::Engine:
#  v1_users GET  /v1/users(.:format)      api/v1/users#index {:format=>:json}
#   v1_user GET  /v1/users/:id(.:format)  api/v1/users#show {:format=>:json}
# v1_groups GET  /v1/groups(.:format)     api/v1/groups#index {:format=>:json}
#  v1_group GET  /v1/groups/:id(.:format) api/v1/groups#show {:format=>:json}
#
# Routes for WebStyle::Engine:
#
#
# Routes for SampleData::Engine:
#
#
# Routes for Search::Engine:
#
#
# Routes for Jobs::Engine:
#
#
# Routes for Cms::Engine:
# retrieve_cms GET    /cms/retrieve(.:format) cms/cms#retrieve
#          cms GET    /cms(.:format)          cms/cms#index
#              POST   /cms(.:format)          cms/cms#create
#       new_cm GET    /cms/new(.:format)      cms/cms#new
#      edit_cm GET    /cms/:id/edit(.:format) cms/cms#edit
#           cm GET    /cms/:id(.:format)      cms/cms#show
#              PATCH  /cms/:id(.:format)      cms/cms#update
#              PUT    /cms/:id(.:format)      cms/cms#update
#              DELETE /cms/:id(.:format)      cms/cms#destroy
#

Rails.application.routes.draw do


  
  # Order of engines mount is important if each engine has its own database migration.
  # You need to sequence is such that database migrations ans sychnronized correctly
  mount Persistence::Engine, at: '/'
  mount Authentication::Engine, at: '/'
  mount Authorization::Engine, at: '/'
  mount Api::Engine, at: '/api'
  mount StateMachines::Engine, at: '/'
  mount WebStyle::Engine, at: '/'
  mount SampleData::Engine, at: '/'
  mount Search::Engine, at: '/'
  mount Jobs::Engine, at: '/'
  mount Cms::Engine, at: '/'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/dev/emails'
  end

  # Route for Omniauth authentication

  match '/auth/:provider/callback' => 'authentication/authentications#create', via: [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

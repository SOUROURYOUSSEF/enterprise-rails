# add require for any concerns of other files that you need before starting rails
require 'searchable/group'
require 'searchable/user'
#require 'associable/user'
#User.send :include, Associable::User
# NOTE: adding search capability to Group and User Models
User.send :include, Searchable::User
Group.send :include, Searchable::Group
ApplicationScope.send :include, Searchable::ApplicationScope
# Need to call init.rb explictely since we are using it outside of main application
require 'sunspot/rails/init.rb'
